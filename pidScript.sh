#!/usr/bin/env bash

if [ "$1" == "start" ]; then

    cd backend
    npm run dev &
    echo $! > ../backend.pid
    cd ..

    cd frontend
    npm run dev &
    echo $! > ../frontend.pid
    cd ..

    echo "Started backend and frontend"
    echo "Backend PID: $(cat backend.pid)"
    echo "Frontend PID: $(cat frontend.pid)"

elif [ "$1" == "stop" ]; then

    kill $(cat backend.pid) 2>/dev/null
    rm -f backend.pid

    kill $(cat frontend.pid) 2>/dev/null
    rm -f frontend.pid

    echo "Stopped backend and frontend"

else
    echo "Use: ./dev-services.sh start | stop"
fi

