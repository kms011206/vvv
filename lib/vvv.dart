import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

String _sortOption = '';
bool isAscending = true;

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Self Cooker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: RecipeListScreen(),
    );
  }
}

class Recipe {
  final String name;
  final String description;
  final List<String> ingredients;
  final String image;
  final List<String> steps;
  bool isFavorite;
  final int calories;
  final int difficulty; // 난이도 필드 추가

  Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.steps,
    this.isFavorite = false,
    required this.calories,
    required this.difficulty, // required 키워드 추가
  });
}

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipe> recipes = [
    Recipe(
      name: '스파게티 카르보나라',
      description: '고전적인 이탈리아 요리',
      ingredients: [
        '스파게티 면',
        '베이컨',
        '계란',
        '파마산 치즈',
        '황색 양파',
        '다진 마늘',
        '올리브 오일',
        '소금',
        '후추',
      ],
      image: 'C:/project/vvv/image/spaghetti.jpg',
      steps: [
        '파마산 치즈를 갈아준다.',
        '파마산 치즈, 계란, 후추, 소금을 섞어 카르보나라 소스를 만든다.',
        '스파게티 면을 삶은 후 체에 밭쳐 물기를 뺀다.',
        '뜨거운 팬에 올리브 오일을 두르고 다진 마늘과 황색 양파를 볶는다.',
        '베이컨을 추가하고 익을 때까지 볶는다.',
        '삶은 스파게티 면을 팬에 넣고 카르보나라 소스를 넣어 섞는다.',
        '완성된 스파게티 카르보나라를 그릇에 담는다.',
        '마지막으로 파마산 치즈를 골고루 뿌려준다.',
      ],
      isFavorite: false,
      calories: 500,
  difficulty: 3, // 난이도 평점 설정
  ),
    Recipe(
      name: '치킨 커리',
      description: '매콤하고 풍부한 커리',
      ingredients: [
        '닭고기',
        '양파',
        '마늘',
        '생강',
        '고추',
        '코코넛 밀크',
        '커리 분말',
        '고춧가루',
        '식용유',
        '소금',
        '후추'
      ],
      image: 'C:/project/vvv/image/chicken_curry.jpg',
      steps: [
        '양파, 마늘, 생강, 고추를 다진다.',
        '뜨거운 팬에 식용유를 두르고 양파를 볶는다.',
        '양파가 투명해질 때까지 볶는다.',
        '다진 마늘, 생강, 고추를 추가하고 볶는다.',
        '닭고기를 넣고 익을 때까지 볶는다.',
        '커리 분말을 넣고 볶는다.',
        '코코넛 밀크를 넣고 약한 불에서 끓인다.',
        '마지막으로 고춧가루, 소금, 후추로 간을 맞춘다.',
        '완성된 치킨 커리를 그릇에 담아 남은 재료와 함께 곁들여 준다.',
      ],
      isFavorite: false,
      calories: 600, // 칼로리 값 추가
      difficulty: 4, // 난이도 평점 설정
  ),

    Recipe(
      name: '피자',
      description: '맛있고 양질의 피자',
      ingredients: [
        '밀가루',
        '이스트',
        '올리브 오일',
        '소금',
        '설탕',
        '따뜻한 물',
        '토마토 소스',
        '모짜렐라 치즈',
        '피자 토핑 재료 (페퍼로니, 햄, 버섯, 올리브 등)',
      ],
      image: 'C:/project/vvv/image/pizza.jpg',
      steps: [
        '밀가루, 이스트, 올리브 오일, 소금, 설탕을 섞는다.',
        '따뜻한 물을 조금씩 넣으면서 반죽을 만든다.',
        '만들어진 반죽을 덮어두고 발효시킨다.',
        '발효가 완료된 반죽을 가지고 도우를 만든다.',
        '도우 위에 토마토 소스와 모짜렐라 치즈를 바른다.',
        '원하는 피자 토핑 재료를 올린다.',
        '200도로 예열한 오븐에서 10-15분간 굽는다.',
        '완성된 피자를 자르고 서빙한다.',
      ],
      isFavorite: false,
      calories: 800,
  difficulty: 2, // 난이도 평점 설정
  ),

    Recipe(
      name: '햄버거',
      description: '고소하고 맛있는 햄버거',
      ingredients: [
        '햄버거 패티',
        '햄버거 번',
        '양상추',
        '토마토',
        '양파',
        '피클',
        '치즈',
        '케첩',
        '마요네즈',
      ],
      image: 'C:/project/vvv/image/hamburger.jpg',
      steps: [
        '햄버거 패티를 그릴이나 팬에서 구워준다.',
        '햄버거 번을 굽거나 토스터기에 구워서 따뜻하게 준비한다.',
        '양상추, 토마토, 양파, 피클을 손질하여 준비한다.',
        '햄버거 번을 베이스로 하여 순서대로 양상추, 토마토, 양파, 햄버거 패티, 치즈, 피클을 올린다.',
        '케첩과 마요네즈를 조금씩 뿌려준다.',
        '다른 반쪽의 햄버거 번을 올려서 완성한다.',
        '햄버거를 잘라서 서빙한다.',
      ],
      isFavorite: false,
      calories: 600,
  difficulty: 2, // 난이도 평점 설정
  ),

    Recipe(
      name: '스테이크',
      description: '부드럽고 고급스러운 스테이크',
      ingredients: [
        '스테이크',
        '소금',
        '후추',
        '버터',
        '올리브 오일',
        '다진 마늘',
        '로즈마리',
      ],
      image: 'C:/project/vvv/image/steak.jpg',
      steps: [
        '스테이크에 소금과 후추를 골고루 뿌린다.',
        '뜨거운 팬에 버터와 올리브 오일을 두르고 다진 마늘과 로즈마리를 볶는다.',
        '마늘과 로즈마리가 향이 나기 시작하면 팬에 스테이크를 올린다.',
        '한 쪽 면을 고온으로 2-3분간 구워준다.',
        '스테이크를 뒤집어서 다른 쪽 면을 2-3분간 구워준다.',
        '두 면을 고온으로 구워준 후, 중간 불로 낮추어 추가적으로 구워준다.',
        '원하는 익기 정도에 따라 구워주며, 약 5-7분간 추가로 구워준다.',
        '스테이크를 그릇에 옮겨 휴식시킨다.',
        '휴식시킨 스테이크를 잘라서 서빙한다.',
      ],
      isFavorite: false,
      calories: 800,
  difficulty: 5, // 난이도 평점 설정
  ),

    Recipe(
      name: '샐러드',
      description: '신선하고 건강한 샐러드',
      ingredients: [
        '채소 (양상추, 토마토, 오이, 당근 등)',
        '고구마',
        '계란',
        '올리브 오일',
        '레몬 주스',
        '소금',
        '후추',
      ],
      image: 'C:/project/vvv/image/salad.jpg',
      steps: [
        '양상추, 토마토, 오이, 당근 등을 손질하여 적절한 크기로 썰어준다.',
        '고구마를 삶아서 썰어준다.',
        '계란을 삶아서 썰어준다.',
        '모든 재료를 큰 그릇에 담는다.',
        '올리브 오일과 레몬 주스를 골고루 뿌려준다.',
        '소금과 후추로 간을 맞춘다.',
        '그릇 속 재료를 서서히 섞어준다.',
        '완성된 샐러드를 그릇에 담아서 서빙한다.',
      ],
      isFavorite: false,
      calories: 200,
      difficulty: 1, // 난이도 평점 설정
  ),

    Recipe(
      name: '김치찌개',
      description: '매콤하고 진한 김치찌개',
      ingredients: [
        '돼지고기',
        '김치',
        '두부',
        '양파',
        '대파',
        '고추',
        '다시마',
        '멸치다시팩',
        '고춧가루',
        '된장',
        '소금',
        '참기름',
      ],
      image: 'C:/project/vvv/image/kimchi_stew.jpg',
      steps: [
        '물에 멸치다시팩과 다시마를 넣고 국물을 끓인다.',
        '돼지고기를 넣고 익을 때까지 끓인다.',
        '김치를 넣고 약간 더 끓인다.',
        '양파, 대파, 고추를 넣고 익힌다.',
        '된장과 고춧가루를 넣고 간을 맞춘다.',
        '마지막에 참기름을 뿌려준다.',
        '완성된 김치찌개를 그릇에 담아서 서빙한다.',
      ],
      isFavorite: false,
      calories: 350,
  difficulty: 3, // 난이도 평점 설정
  ),

    Recipe(
      name: '간장계란밥',
      description: '간단하고 맛있는 간장계란밥',
      ingredients: [
        '밥',
        '계란',
        '간장',
        '식초',
        '설탕',
        '김',
        '참기름',
        '김치',
      ],
      image: 'C:/project/vvv/image/soy_sauce_rice.jpg',
      steps: [
        '계란을 풀어서 후라이팬에 부친다.',
        '계란에 소금을 약간 넣어 간을 맞춘다.',
        '밥에 간장, 식초, 설탕을 넣고 비벼준다.',
        '뜨거운 밥 위에 부친 계란을 얹어준다.',
        '김과 참기름을 뿌려준다.',
        '김치를 곁들여 준다.',
        '간장계란밥을 그릇에 담아서 서빙한다.',
      ],
      isFavorite: false,
      calories: 400,
  difficulty: 1, // 난이도 평점 설정
  ),

    //추가할 음식들
  ];

  List<Recipe> favoriteRecipes = [];
  List<Recipe> filteredRecipes = [];
  Recipe? recommendedRecipe;
  Timer? timer;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecipes = List.from(recipes);
    setRecommendedRecipe();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    searchController.dispose();


    super.dispose();
  }

  void setRecommendedRecipe() {
    final random = Random();
    final index = random.nextInt(recipes.length);
    recommendedRecipe = recipes[index];
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      setRecommendedRecipe();
    });
  }

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        favoriteRecipes.add(recipe);
        _showFavoriteAddedSnackbar(recipe.name);  // 즐겨찾기에 추가되었을 때 알림 표시
      } else {
        favoriteRecipes.remove(recipe);
        _showFavoriteRemovedSnackbar(recipe.name);  // 즐겨찾기에서 제거되었을 때 알림 표시
      }
    });
  }

  void _showFavoriteAddedSnackbar(String recipeName) {
    final snackBar = SnackBar(
      content: Text('$recipeName이(가) 즐겨찾기 목록에 추가되었습니다.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showFavoriteRemovedSnackbar(String recipeName) {
    final snackBar = SnackBar(
      content: Text('$recipeName이(가) 즐겨찾기 목록에서 제거되었습니다.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




  void filterRecipes(String query) {
    setState(() {
      filteredRecipes = recipes
          .where((recipe) =>
      recipe.name.toLowerCase().contains(query.toLowerCase()) ||
          recipe.description.toLowerCase().contains(query.toLowerCase()) ||
          recipe.ingredients.any((ingredient) =>
              ingredient.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }
  void _changeSortOption() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return SimpleDialog(
          title: Text('정렬 옵션 선택'),
          children: [
          SimpleDialogOption(
          onPressed: () {
        _sortOption = '이름순';
        Navigator.pop(context, '이름순');
        _sortData(); // Call _sortData() after selecting the sort option.
        setState(() {}); // Update the UI
        _refreshData();
      },
    child: Text('이름순'),
    ),
    SimpleDialogOption(
    onPressed: () {
    _sortOption = '칼로리순';
    Navigator.pop(context, '칼로리순');
    _sortData(); // Call _sortData() after selecting the sort option.
    setState(() {}); // Update the UI
    _refreshData();
    },
    child: Text('칼로리순'),
    ),
    SimpleDialogOption(
    onPressed: () {
    _sortOption = '난이도순';
    Navigator.pop(context, '난이도순');
    _sortData(); // Call _sortData() after selecting the sort option.
    setState(() {}); // Update the UI
    _refreshData();
    },
    child: Text('난이도순'),
    ),
          ],
      );
        },
    ).then((value) {
      if (value != null) {
        setState(() {
          _sortOption = value;
        });
        _sortData(); // Call _sortData() after selecting the sort option.
        _refreshData();
      }
    });
  }

    void _refreshData() {
    _sortData(); // 데이터 정렬
    setState(() {}); // UI 갱신
  }

  void _sortData() {
    setState(() {
      if (_sortOption == '이름순') {
        filteredRecipes.sort((a, b) => a.name.compareTo(b.name)); // Sort by name
      } else if (_sortOption == '칼로리순') {
        filteredRecipes.sort((a, b) => a.calories.compareTo(b.calories)); // Sort by calories
      } else if (_sortOption == '난이도순') {
        filteredRecipes.sort((a, b) => a.difficulty.compareTo(b.difficulty)); // Sort by difficulty
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Self Cooker'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.restaurant_menu_outlined),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      // 메뉴 영역 추가
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Text(
                '메뉴',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('홈으로'),

              // 홈 버튼 클릭 시 메뉴 닫기
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('즐겨찾는 레시피'),

              // 즐겨찾기 버튼 클릭 시 메뉴 닫고 즐겨찾기 화면으로 이동
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteRecipeScreen(
                      favoriteRecipes: favoriteRecipes,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterRecipes,
              decoration: InputDecoration(
                labelText: '요리명 또는 재료명을 입력하세요',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredRecipes.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return recommendedRecipe != null
                      ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이런 요리는 어떠세요?',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailScreen(
                                    recipe: recommendedRecipe!,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    recommendedRecipe!.image,
                                  ),
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.7),
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        recommendedRecipe!.name,
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        recommendedRecipe!.description,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                            color: Colors.grey[200],  // 배경색 설정
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),  // 제목 주변 여백 설정
                            child: Text(
                              '레시피 목록',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () {
                            // _changeSortOption() 함수를 호출하여 정렬 옵션을 변경합니다.
                            _changeSortOption();
                            // 정렬 옵션에 따라 데이터를 다시 정렬하는 함수를 호출합니다.

                          },
                        ),
                        ],
                      ),
                  ],),)
                      : Container();
                }



                final recipeIndex = index - 1;
                final recipe = filteredRecipes[recipeIndex];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(
                          recipe: recipe,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(recipe.image),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                recipe.description,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
  SizedBox(height: 3),
  Text(
  'Kcal: ${recipe.calories}', // 칼로리 정보 표시
  style: TextStyle(
  fontSize: 14,
  ),
  ),
                          SizedBox(width: 10),
                          Row(
                            children: List.generate(
                              recipe.difficulty, // 난이도에 해당하는 숫자만큼 별을 생성
                                  (index) => Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                            ),)
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            recipe.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () {
                            toggleFavorite(recipe);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(recipe.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '재료',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.ingredients
                        .map((ingredient) => Text('• $ingredient'))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '요리 순서',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: recipe.steps
                        .asMap()
                        .map(
                          (index, step) => MapEntry(
                        index,
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue, // 아이콘의 배경색 설정
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.white, // 아이콘의 숫자 색상 설정
                                  ),
                                ),
                              ),
                              SizedBox(width: 8), // 번호와 텍스트 사이의 간격 조정
                              Flexible(
                                child: Text(
                                  step,
                                  softWrap: true, // 텍스트 자동 줄바꿈 활성화
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        .values
                        .toList(),
                  ),


                  SizedBox(height: 16),
                  Text(
                    '칼로리',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${recipe.calories} kcal',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteRecipeScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoriteRecipeScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('즐겨찾는 요리'),
      ),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return ListTile(
            leading:

            Image.asset(recipe.image),
            title: Text(recipe.name),
            subtitle: Text(recipe.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    recipe: recipe,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}