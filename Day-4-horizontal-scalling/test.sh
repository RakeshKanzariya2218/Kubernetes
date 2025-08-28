for j in {1..10}; do  
    for i in {1..1000}; do  
        curl -s -o /dev/null -w "%{http_code}\n" http://a04778f3dcd9d4d58a7a5fc95e9d7d81-1734691748.us-east-1.elb.amazonaws.com/ &  
    done  
    wait  # Wait for all background curl processes to finish before next iteration
done

# change the lb dns with your lb dbs 