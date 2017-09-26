rm -rf ./release;
mkdir release;
cp -r ./api ./release;
cd client && npm run build;
cp -r build/* ../release;
cd ../ && cp -r api ./release;