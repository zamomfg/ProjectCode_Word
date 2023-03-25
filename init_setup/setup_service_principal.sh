#!/bin/bash

read -p "Enter Subscription ID:" subscription

az ad sp create-for-rbac --name Github_ProjectCode_Word_SP --role contributor --scopes /subscriptions/$subscription --sdk-auth