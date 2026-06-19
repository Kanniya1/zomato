import streamlit as st
import pandas as pd
st.title('zomato')
st.write('dashboard starter project')
page=st.sidebar.selectbox("menu",["home","customer","sql analytics"])
st.write('selected:',page)