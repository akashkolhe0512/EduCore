#!/bin/bash

# List of new components
components=(
  "dashboard"
  "admission"
  "class"
  "users"
  "student-evaluation"
  "homework"
  "attendance"
  "payment"
  "library"
  "hostel"
  "transports"
  "report"
  "settings"
)

ROUTES_DIR="src/routes"

# 1. Remove all old folders/files in routes except layout and not-found
echo "Cleaning up old route components..."
find "$ROUTES_DIR" -mindepth 1 -maxdepth 1 ! -name "layout" ! -name "not-found" -exec rm -rf {} +

# 2. Create a new folder/file for each new component
for name in "${components[@]}"; do
  mkdir -p "$ROUTES_DIR/$name"
  cat > "$ROUTES_DIR/$name/page.tsx" <<EOF
export default function $(echo "$name" | sed -r 's/(^|-)([a-z])/\U\2/g')Page() {
  return <h1 className="title">$(echo "$name" | sed -r 's/(^|-)([a-z])/\U\2/g' | sed 's/-/ /g')</h1>;
}
EOF
  echo "Created: $ROUTES_DIR/$name/page.tsx"
done

echo "All new route components have been created!"