# Finance service

Thu thập và phân tích dữ liệu dịch vụ tài chính sử dụng bộ dữ liệu [Retail Banking](https://www.kaggle.com/datasets/kabure/retail-bankingdemodata/data?select=completedcard.csv) trên Kaggle


## Installation
B1: Download bộ dữ liệu từ kaggle về, upload lên BigQuery, lấy file key và cho vào folder "conf"

B2: Cài đặt DBT
```bash

bin\windows\install_python_venv
bin\windows\install_python_libraries
bin\windows\install_dbt_libraries
```

Kiểm tra phiên bảng DBT
```bash
dbt --version
dbt debug
```

B3: Sửa đường dẫn key trong "profiles.yml"


## Contributing


## License

[MIT](https://choosealicense.com/licenses/mit/)