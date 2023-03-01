import 'package:flutter/material.dart';
import 'package:frontend/theme.dart';

class NewsTile extends StatelessWidget {
  String title;
  String category;
  String thumbnail;
  String created_at;

  NewsTile(
    this.title,
    this.category,
    this.thumbnail,
    this.created_at,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xfff3f3f3)))),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 20, top: 26),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: secondaryTextStyle,
                    ),
                    Text(
                      title,
                      style: standarTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 123,
                height: 95,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                created_at,
                style: standarTextStyle.copyWith(fontSize: 12),
              ),
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        color: subtitleColor, shape: BoxShape.circle),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        color: subtitleColor, shape: BoxShape.circle),
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        color: subtitleColor, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
