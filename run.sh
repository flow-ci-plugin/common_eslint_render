
set +e
response=`curl -sSL -d "project_id=$FLOW_PROJECT_ID" $FLOW_QINIU_UPLOAD_URL`
token=$(echo $response | jq .token)
key=$(echo $response | jq .key)
upload_url=$(echo $response | jq .upload_url)
download_url=$(echo $response | jq .download_url)
token=$(echo $token | sed 's/\"//g')
upload_url=$(echo $upload_url | sed 's/\"//g')
key=$(echo $key | sed 's/\"//g')
download_url=$(echo $download_url | sed 's/\"//g')
echo $token
echo $upload_url
curl -L  https://github.com/FIRHQ/flow_format_render_eslint/archive/master.zip > /tmp/master.zip
cd /tmp
unzip master.zip
cd flow_format_render_eslint-master
npm install
FLOW_ESLINT_RESULT_PATH=$FLOW_ESLINT_LOG_PATH node ./bin/render.js
cp dist/index.html ${FLOW_PROJECT_ID}.html

# echo "hello" > index.html
file_path="$FLOW_PROJECT_ID"
curl -# -F file=@${file_path}.html -F "key=$key" -F "token=$token" -F "Content-Type=html" $upload_url
FLOW_ESLINT_RENDER_URL=$download_url
echo "download...url"
echo $FLOW_ESLINT_RENDER_URL