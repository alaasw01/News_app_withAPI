import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/webview_screen/webview_screen.dart';

Widget buildArticleBuilder(list,context,{isSearch=false})=> ConditionalBuilder(
          condition: list.length>0 ,
           builder: (context)=> ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=> buildBusinessArticles(list[index],context), 
            separatorBuilder:(context,index)=> SizedBox(height: 10.0),
             itemCount: 10) ,
            fallback:(context)=> isSearch?Container(): Center(child: CircularProgressIndicator(),));

Widget buildBusinessArticles(article,context)=> InkWell(
  onTap: (){
    navigateTo(context, WebviewScreen(url: article['url']));
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 150.0,
  
              height: 150.0,
  
              decoration: BoxDecoration(
  
                borderRadius: BorderRadius.circular(20.0),
  
                image: DecorationImage(
  
                  fit: BoxFit.cover,
  
                  image: NetworkImage('${article['urlToImage']}'))
  
              ),
  
            ),
  
            const SizedBox(width: 10.0,),
  
            Expanded(
  
              child: Container(
  
                height: 150.0,
  
                child:  Column(
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  children: [
  
                    Expanded(
  
                      child: Text('${article['title']}',style: Theme.of(context).textTheme.bodyLarge,
  
                      maxLines: 3,overflow: TextOverflow.ellipsis,),
  
                    ),
  
                      Text('${article['publishedAt']}',style: const TextStyle(
  
                        color: Colors.grey,
  
                      fontSize: 20.0,
  
                   
  
                    ),),
  
                  ],
  
                ),
  
              ),
  
            ),
  
          ],
  
        ),
  
      ),
);

 void navigateTo(context,widget)=> Navigator.of(context).push(MaterialPageRoute(builder: (context) =>widget));

    