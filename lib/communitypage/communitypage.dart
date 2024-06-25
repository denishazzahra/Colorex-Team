import 'package:colorex/model/post.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subpages/newpostpage.dart';

import 'package:colorex/widget/costum_community_post.dart';

class MyCommunityFeedPage extends StatefulWidget {
  const MyCommunityFeedPage({super.key});

  @override
  State<MyCommunityFeedPage> createState() => _MyCommunityFeedPageState();
}

class _MyCommunityFeedPageState extends State<MyCommunityFeedPage> {
  
  Future<void> _refresh() async {

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Consumer<MyPostDataManager>(
          builder: (context, posting, _ ) => ListView.builder(
          itemCount: posting.communityPost.length, // Number of vertical items
          itemBuilder: (context, index) {
            return MyCommunityPost(postData: posting.communityPost[index]);
          },
        ),
        ),
      ), 
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MyCreatePostPage())).then((_) {
                  setState(() {
                    
                  });
                });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
