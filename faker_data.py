from faker import Faker
import pandas as pd 
import random
fake=Faker()
customers=[]
for i in range(1,101):
    customers.append({"customer_id":i,
                      "name":fake.name(),
                      "email":fake.email(),
                      "phone":fake.msisdn()[:10],
                      "location":fake.city(),
                      "singup_date":fake.date_this_decade(),
                      "is_premium":random.choice([0,1]),
                      "preferred_cuisine":random.choice(["indian","chinese","italian","arabian"]),
                      "total_orders":random.randint(1,50),"average_rating":round(random.uniform(3,5),1)})
    df=pd.DataFrame(customers)
    df.to_csv("customers.csv",index=False)
    print("customers.csv created successfully")

restaurants=[]
for i in range(1,101):
    restaurants.append({"restaurant_id":i,
                        "name":fake.company(),
                        "cuisine_type":random.choice(["indian","chinese","italian","arabian"]),
                        "location":fake.city(),
                        "owner_name":fake.name(),
                        "average_delivery_time":random.randint(20,60),
                        "contact_number":fake.msisdn()[:10],
                        "rating":round(random.uniform(3,5),2),
                        "total_orders":random.randint(1,50),
                        "is_active":random.choice([0,1])
                        }) 
df=pd.DataFrame(restaurants)
df.to_csv("restaurants.csv",index=False)
print("restaurants.csv created successfully")

delivery_person=[]
vehicles=["bike","scooter","cycle"]
for i in range(1,101):
    delivery_person.append({
        "delivery_person_id":i,
        "name":fake.name(),
        "contact_number":fake.msisdn()[:10],
        "vehicle_type":random.choice(vehicles),
        "total_deliveries":random.randint(50,1000),
        "average_rating":round(random.uniform(3,5),2),
        "location":fake.city() })
df=pd.DataFrame(delivery_person)
df.to_csv("delivery_person.csv",index=False)
print("delivery_persons.csv created successfully")


orders=[]
status_list=['pending','preparing','out for delivery','delivered','cancelled']
payments_modes=['cash','upi','credit card','debit card']
for i in range(1,101):
    orders.append({"order_id":i,
                   "customer_id":random.randint(1,100),
                   "restaurants_id":random.randint(1,100),
                   "order_date":fake.date_time_this_year(),
                   "delivery_time":fake.date_time_this_year(),
                   "total_amount":round(random.uniform(50,1500),2),
                   "feedback_rating":random.randint(1,5)})

df=pd.DataFrame(orders)
df.to_csv("orders.csv",index=False)
print("orders.csv created successfully")


deliveries=[]
delivery_status=['assinged','on the way','delivered','cancelled']
vehicles=["bike","scooter","cycle"]
for i in range(1,101):
    deliveries.append({"delivery_id":i,
                       "oredr_id":i,
                       "delivery_person_id":random.randint(1,200),
                       "delivery_status":random.choice(delivery_status),
                       "distance":round(random.uniform(1,20),2),
                       "delivery_time":random.randint(10,60),
                       "estimated_time":random.randint(15,70),
                       "delivery_fee":round(random.uniform(20,100),2),
                       "vehicle_type":random.choice(vehicles)
                        })
    df=pd.DataFrame(deliveries)
    df.to_csv("deliveries.csv",index=False)
    print("deliveries.csv created successfully")