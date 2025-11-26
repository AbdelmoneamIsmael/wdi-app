class CategoryEntity {
  final String id;
  final String name;
  final String image;

  CategoryEntity({required this.id, required this.name, required this.image});
}

List<CategoryEntity> categoryList = [
  CategoryEntity(
    id: '1',
    name: 'perfume',
    image:
        'https://i.pinimg.com/736x/08/2d/46/082d464e9b0f4bd919b0a71f3b51074f.jpg',
  ),
  CategoryEntity(
    id: '2',
    name: 'diamonds',
    image:
        'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcR6LyETJxkyolkB5c5q8ag6uYzgZQHnXnjw8syUjx8Jk2HKnxto',
  ),
  CategoryEntity(
    id: '3',
    name: 'phons',
    image:
        'https://i0.wp.com/buyphonez.lk/wp-content/uploads/2024/12/i-16-1.jpg?resize=300%2C300&ssl=1',
  ),
  CategoryEntity(
    id: '4',
    name: 'tvs',
    image:
        'https://m.media-amazon.com/images/I/81pieXC63IL._AC_SL1500_.jpg',
  ),
  CategoryEntity(
    id: '5',
    name: 'watches',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYteQQnzfyzdChUzbqQT4CEEEaafdW0dzaSw&s',
  ),
  CategoryEntity(
    id: '6',
    name: 'laptops',
    image:
        'https://m.media-amazon.com/images/I/61fA3L7NbrL._AC_SL1500_.jpg',
  ),
  CategoryEntity(
    id: '7',
    name: 'appliances',
    image:
        'https://www.stelrad.com/wp-content/uploads/2024/08/shutterstock_2473408983-2.jpg',
  ),
];
