# Ruby on Rails Project

Welcome to the **Ruby on Rails Project**! This guide will help you set up and run the project on your local machine.

## Prerequisites

Before you begin, make sure you have the following installed:

- **Ruby** (Check version: `ruby -v`)
- **Rails** (Check version: `rails -v`)
- **Bundler** (Install if needed: `gem install bundler`)
- **Node.js**
- **Mysql** (or the database required by the project)
- **Git** (to clone the repository)

## Setup Instructions

### 1. Clone the Repository


- ```sh```git clone https://github.com/Hungtofu/test_app_thpt_score.git
- ```sh```cd test_app_thpt_score

### 2. Install Dependencies

- ```sh```bundle install

### 3. Set Up Database

- ```sh```rails db:create
- ```sh```rails db:migrate
- ```sh```rails db:seed  # Optional: Seed the database with sample data

### 4. Start the Server

- ```sh```rails server
