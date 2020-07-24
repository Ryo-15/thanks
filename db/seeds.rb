# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@example.jp",
  password: "aaaaaa"
  )

Department.create!(
  [
    {
      name: "営業",
    },
    {
      name: "事務",
    },
    {
      name: "エンジニア",
    }
  ]
  )

User.create!(
  [
    {
      last_name: "山下",
      first_name: "智久",
      last_name_kana: "ヤマシタ",
      first_name_kana: "トモヒサ",
      department_id: 1,
      email: "0@0",
      password: "000000",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "西野",
      first_name: "七瀬",
      last_name_kana: "ニシノ",
      first_name_kana: "ナナセ",
      department_id: 2,
      email: "1@1",
      password: "111111",
      profile_image: File.open("./app/assets/images/woman.jpeg", ?r)
    },
    {
      last_name: "向井",
      first_name: "理",
      last_name_kana: "ムカイ",
      first_name_kana: "オサム",
      department_id: 3,
      email: "2@2",
      password: "222222",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "小松",
      first_name: "菜奈",
      last_name_kana: "コマツ",
      first_name_kana: "ナナ",
      department_id: 2,
      email: "3@3",
      password: "333333",
      profile_image: File.open("./app/assets/images/woman.jpeg", ?r)
    },
    {
      last_name: "三宅",
      first_name: "健",
      last_name_kana: "ミヤケ",
      first_name_kana: "ケン",
      department_id: 3,
      email: "4@4",
      password: "444444",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "吉沢",
      first_name: "亮",
      last_name_kana: "ヨシザワ",
      first_name_kana: "リョウ",
      department_id: 3,
      email: "5@5",
      password: "555555",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "星野",
      first_name: "源",
      last_name_kana: "ホシノ",
      first_name_kana: "ゲン",
      department_id: 3,
      email: "6@6",
      password: "666666",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "小林",
      first_name: "由依",
      last_name_kana: "コバヤシ",
      first_name_kana: "ユイ",
      department_id: 1,
      email: "7@7",
      password: "777777",
      profile_image: File.open("./app/assets/images/woman.jpeg", ?r)
    },
    {
      last_name: "佐藤",
      first_name: "健",
      last_name_kana: "サトウ",
      first_name_kana: "タケル",
      department_id: 1,
      email: "8@8",
      password: "888888",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "長澤",
      first_name: "まさみ",
      last_name_kana: "ナガサワ",
      first_name_kana: "マサミ",
      department_id: 1,
      email: "9@9",
      password: "999999",
      profile_image: File.open("./app/assets/images/woman.jpeg", ?r)
    },
    {
      last_name: "山崎",
      first_name: "賢人",
      last_name_kana: "ヤマザキ",
      first_name_kana: "ケント",
      department_id: 1,
      email: "q@q",
      password: "qqqqqq",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "岡田",
      first_name: "将生",
      last_name_kana: "オカダ",
      first_name_kana: "マサキ",
      department_id: 3,
      email: "w@w",
      password: "wwwwww",
      profile_image: File.open("./app/assets/images/man.jpeg", ?r)
    }
  ]
  )

Post.create!(
  [
    {
      sender_id: 1,
      receiver_id: 3,
      post: "この前は資料作り手伝ってくれてありがとう！おかげ様でお客様からも好評でした！"
    },
    {
      sender_id: 6,
      receiver_id: 9,
      post: "この前はプレゼンおつかれさまでした！お客様からも反響の注文をいただきました！ありがとう！"
    },
    {
      sender_id: 5,
      receiver_id: 12,
      post: "いつもコード修正ありがとうございます！"
    },
    {
      sender_id: 2,
      receiver_id: 3,
      post: "ありがとう！"
    },
    {
      sender_id: 7,
      receiver_id: 1,
      post: "ありがとう！"
    },
    {
      sender_id: 8,
      receiver_id: 9,
      post: "ありがとう！"
    },
    {
      sender_id: 7,
      receiver_id: 6,
      post: "ありがとう！"
    },
    {
      sender_id: 5,
      receiver_id: 4,
      post: "ありがとう！"
    },
    {
      sender_id: 9,
      receiver_id: 11,
      post: "ありがとう！"
    },
    {
      sender_id:  10,
      receiver_id: 12,
      post: "ありがとう！"
    },
    {
      sender_id: 3,
      receiver_id: 9,
      post: "ありがとう！"
    },
    {
      sender_id: 8,
      receiver_id: 7,
      post: "ありがとう！"
    },
    {
      sender_id: 3,
      receiver_id: 4,
      post: "ありがとう！"
    },
  ]
  )
