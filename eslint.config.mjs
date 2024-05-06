import globals from "globals"
import js from "@eslint/js"

export default [
    {
        name: "default",
        files: ["**/*.js"],
        languageOptions: {
            sourceType: "script",
            globals: {
                ...globals.node,
            }
        },
        rules: {
            ...js.configs.recommended.rules,
        }
    },
]
