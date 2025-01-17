<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;

class FirstLetterRule implements ValidationRule
{
    /**
     * Run the validation rule.
     *
     * @param  \Closure(string, ?string=): \Illuminate\Translation\PotentiallyTranslatedString  $fail
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $firstLetter = mb_substr($value, 0, 1);

        if ($firstLetter !== mb_strtoupper($firstLetter)) {
            $fail('Название должно быть с большой буквы');
        }
    }
}
