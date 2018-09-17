
swift build -c release --build-path .build/native

mkdir -p .build/lambda

cp .build/native/release/Lambda .build/lambda/

# Copy libraries necessary to run Swift executable
mkdir -p .build/lambda/libraries
ldd .build/native/release/Lambda | grep so | sed -e '/^[^\t]/ d' -e 's/\t//' -e 's/.*=..//' -e 's/ (0.*)//' | xargs -i% cp % .build/lambda/libraries

cp Shim/index.js .build/lambda/

# Zip Swift executable, libraries and Node.js shim
cd .build/lambda
rm -f lambda.zip
zip -r lambda.zip *

cd ../..


