# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2

# Set the working directory to /app
WORKDIR /app 

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install any needed gems
RUN bundle install

# Expose a port if your projects require it (e.g., for Rails applications)
# EXPOSE 3000

# Specify the command to run when the container starts
CMD ["ruby", "app.rb"]
