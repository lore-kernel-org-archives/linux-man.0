From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: charmap.5: clarify keyword syntax
Date: Thu, 23 Jun 2016 12:55:21 +0200
Message-ID: <675e3917-a530-3174-dfcc-5b9a743beba0@gmail.com>
References: <575E5EA5.6050707@redhat.com> <20160614165643.GF4053@vapier.lan>
 <57610A8D.6080105@redhat.com>
 <60df9e3e-8ea2-0c70-c00e-af07f36b0019@gmail.com>
 <5768E7BE.6020002@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5768E7BE.6020002-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Ho Marko,

On 06/21/2016 09:07 AM, Marko Myllynen wrote:
> Hi,
>
> On 2016-06-20 23:34, Michael Kerrisk (man-pages) wrote:
>> On 06/15/2016 09:58 AM, Marko Myllynen wrote:
>>> On 2016-06-14 19:56, Mike Frysinger wrote:
>>>> On 13 Jun 2016 10:20, Marko Myllynen wrote:
>>>>> The patch below updates charmap.5 to match the syntax all the glibc
>>>>> charmap files are using currently.
>>>>
>>>> hmm, i guess this is confusing.  when i read the man page, i see it as
>>>> the normal syntax of "<required value>" rather than the <> being literal
>>>> characers that you need to type out.  although in that regard, i would
>>>> expect it to look something like:
>>>> 	<character> <byte-sequence> [comment]
>>>>
>>>> although in the locale(5) page, we rarely use the <foo> syntax.
>>>
>>> Yes, in the locale(5) page <foo> is now used only in cases like:
>>>
>>>   The characters <space> and <tab> are automatically included.
>>>
>>> In the glibc charmap files the <> notation is used with keywords, the
>>> man pages states that comment is optional but would it make thing
>>> clearer if we would use something like:
>>>
>>> .TP
>>> <
>>> .I code_set_name
>>>> is followed by the name of the character map.
>>>
>>> (Ok, that renders badly but you get the idea.)
>>
>> I'd take patches to fix this.
>>
>> I think you want:
>>
>> .TP
>> .RI < code_set_name >
>
> Thanks, the patch below seems to do the trick:

Thanks! Applied.

Cheers,

Michael


>
> ---
>  man5/charmap.5 | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/man5/charmap.5 b/man5/charmap.5
> index f43d5a5..9bc2440 100644
> --- a/man5/charmap.5
> +++ b/man5/charmap.5
> @@ -28,30 +28,30 @@ can use charmaps to create locale variants for different character sets.
>  The charmap file starts with a header that may consist of the
>  following keywords:
>  .TP
> -.I <code_set_name>
> +.RI < code_set_name >
>  is followed by the name of the character map.
>  .TP
> -.I <comment_char>
> +.RI < comment_char >
>  is followed by a character that will be used as the comment character
>  for the rest of the file.
>  It defaults to the number sign (#).
>  .TP
> -.I <escape_char>
> +.RI < escape_char >
>  is followed by a character that should be used as the escape character
>  for the rest of the file to mark characters that should be interpreted
>  in a special way.
>  It defaults to the backslash (\\).
>  .TP
> -.I <mb_cur_max>
> +.RI < mb_cur_max >
>  is followed by the maximum number of bytes for a character.
>  The default value is 1.
>  .TP
> -.I <mb_cur_min>
> +.RI < mb_cur_min >
>  is followed by the minimum number of bytes for a character.
>  This value must be less than or equal than
> -.IR <mb_cur_max> .
> +.RI < mb_cur_max >.
>  If not specified, it defaults to
> -.IR <mb_cur_max> .
> +.RI < mb_cur_max >.
>  .PP
>  The character set definition section starts with the keyword
>  .I CHARMAP
> @@ -60,12 +60,12 @@ in the first column.
>  The following lines may have one of the two following forms to
>  define the character set:
>  .TP
> -.I <character> byte-sequence comment
> +.RI < character >\  byte-sequence\ comment
>  This form defines exactly one character and its byte sequence,
>  .I comment
>  being optional.
>  .TP
> -.I <character>..<character> byte-sequence comment
> +.RI < character >..< character >\  byte-sequence\ comment
>  This form defines a character range and its byte sequence,
>  .I comment
>  being optional.
> @@ -89,10 +89,10 @@ in the first column.
>  The following lines may have one of the two following forms to
>  define the widths of the characters:
>  .TP
> -.I <character> width
> +.RI < character >\  width
>  This form defines the width of exactly one character.
>  .TP
> -.I <character>...<character> width
> +.RI < character >...< character >\  width
>  This form defines the width for all the characters in the range.
>  .PP
>  The width definition section ends with the string
>
> Cheers,
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
