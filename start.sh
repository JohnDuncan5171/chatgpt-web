
cd ./service
#nohup pnpm start > service.log &
nohup pnpm start >/dev/null 2>& 1 & disown
echo "Start service complete!"


cd ..
echo "" > front.log
#nohup pnpm dev > front.log &
nohup pnpm dev >/dev/null 2>& 1 & disown
echo "Start front complete!"
tail -f front.log
