import sys, os
import re
import pandas as pd

path = os.getcwd()
parent_directory = os.path.dirname(path)
current_directory = path


def main():
    raw_data = pd.read_excel(
        f"{current_directory}/Data/Mexican Restaurants.xlsx"
    )

    dataset = raw_data[
        [
            "customer number",
            "promotion ID",
            "productPurchased",
            "productPurchased3Qty",
            "placeOfPurchase",
            "Qty Purchased",
            "dateOfPurchase",
            "paymentType",
            "payoutAmount",
            "firstname",
            "lastname",
            "email",
            "Age",
            "postcode",
            "state",
            "status",
            "device",
            "datePaid",
        ]
    ]

    dataset = (
        dataset.fillna("NULL")
        .assign(
            last_name_cleansed=lambda x: x["lastname"].apply(
                lambda y: y if len(y.split()) < 3 else "INVALID LASTNAME"
            ),
            place_of_purchase_cleansed=lambda x: x["placeOfPurchase"].apply(
                lambda y: str(y).replace(":", "")
            ),
            date_paid_cleansed=lambda x: x["datePaid"].apply(
                lambda y: y if y != "00/00/0000" else "1990-01-01"
            ),
            email_cleansed=lambda x: x["email"].apply(
                lambda y: "".join(
                    re.findall(r"[a-z0-9\.\-+_]+@[a-z0-9\.\-+_]+\.[a-z]+", y)
                )
                if len(y.split()) > 1
                else y
            ),
        )
        .drop("lastname", axis=1)
        .drop("placeOfPurchase", axis=1)
        .drop("datePaid", axis=1)
        .drop("email", axis=1)
    )

    dataset["date_paid_cleansed"] = pd.to_datetime(
        dataset["date_paid_cleansed"]
    ).dt.normalize()

    dataset.to_csv(f"{current_directory}\Data\cleansed_resultset.csv", index=False)

    print(
        "\n******************************************************************************"
    )
    print(
        "The transformations have been performed successfully on four columns: 'lastname', 'placeOfPurchase', 'datepaid', 'email'"
    )
    print("\nThe transformed dataset has been saved as 'cleansed_resultset.csv'.")
    print(
        "\n******************************************************************************\n"
    )


main()
