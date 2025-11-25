import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../network/rest_client.dart';
import '../models/post.dart';
class PostsPage extends StatefulWidget {
  const PostsPage({super.key});
  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late final RestClient api;
  late Future<List<Post>> future;

  @override
  void initState() {
    super.initState();
    api = RestClient(Dio());
    future = api.getPosts();
  }

  Future<void> _refresh() async {
    setState(() {
      future = api.getPosts();
    });
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: FutureBuilder<List<Post>>(
        future: future,
        builder: (ctx, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text("Erreur: ${snap.error}"));
          }
          final posts = snap.data ?? const <Post>[];
          if (posts.isEmpty) {
            return const Center(child: Text("Aucun post"));
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (_, i) {
                final p = posts[i];
                return ListTile(
                  title: Text(p.title),
                  subtitle: Text(
                    p.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () async {
                    final detail = await api.getPostById(p.id ?? 1);
                    if (!mounted) return;
                    showDialog(
                      context: context,
                      builder: (_) =>
                          AlertDialog(
                            title: Text('Post #${detail.id ?? 0}'),
                            content: Text(detail.body),

                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Fermer'),
                              ),
                            ],
                          ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}