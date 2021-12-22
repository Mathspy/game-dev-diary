curl -O -L https://github.com/Mathspy/diary-generator/releases/latest/download/diary-generator
chmod +x diary-generator

GREYCLIFF_URL=$(
  curl "https://api.notion.com/v1/databases/6f2feb4a7090481e9b17e18534b43ee1/query" \
  -X POST \
  -H "Notion-Version: 2021-08-16" \
  -H "Authorization: Bearer $NOTION_TOKEN" \
  | jq --raw-output '.results[].properties.File.files[] | select( .name == "greycliff.zip" ) | .file.url'
)

curl $GREYCLIFF_URL -o greycliff.zip

unzip greycliff.zip -d public

./diary-generator 4045404e233a427884f0b3389887b315
