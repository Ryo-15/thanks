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
      profile_image_id: File.open("./app/assets/images/man.jpeg", ?r)
    },
    {
      last_name: "西野",
      first_name: "七瀬",
      last_name_kana: "ニシノ",
      first_name_kana: "ナナセ",
      department_id: 2,
      email: "1@1",
      password: "111111",
      profile_image_id: File.open("./app/assets/images/woman.jpeg", ?r)
    }
  ]
  )
