From: Keith Thompson <keithsthompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: backtrace(3): Inconsistency and missing indentation
Date: Fri, 26 Feb 2016 11:52:37 -0800
Message-ID: <CAAHpriNbkVCsH-mrVi97Y57ahw=6yO=kh+C7OuLzfQXrJiJO-Q@mail.gmail.com>
References: <56CD772C.8030606@gmx.de>
	<56D07349.10901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D07349.10901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Martin Gebert <Murphy.Gebert-Mmb7MZpHnFY@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Feb 26, 2016 at 7:46 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 02/24/2016 10:26 AM, Martin Gebert wrote:
>> In the example section of the page the following snippet is given:
>>
>> --8><--
>>         void
>>         myfunc3(void)
>>         {
>>             int j, nptrs;
>>         #define SIZE 100
>>             void *buffer[100];
>>             char **strings;
>>
>>             nptrs = backtrace(buffer, SIZE);
>> --><8--
>>
>> Problems:
>>
>>  1. "#define SIZE 100" is not indented correctly.
>>  2. SIZE should also be used for the buffer array size.
>
> Thanks, Martin. Fixed as below.
>
> Cheers,
>
> Michael
>
> diff --git a/man3/backtrace.3 b/man3/backtrace.3
> index afca93d..064b970 100644
> --- a/man3/backtrace.3
> +++ b/man3/backtrace.3
> @@ -215,8 +215,8 @@ void
>  myfunc3(void)
>  {
>      int j, nptrs;
> -#define SIZE 100
> -    void *buffer[100];
> +    const int SIZE = 100;
> +    void *buffer[SIZE];
>      char **strings;
>
>      nptrs = backtrace(buffer, SIZE);

I suggest leaving it as it was, apart from using SIZE in the definition
of buffer.

It's common for preprocessor directives to be left-justified rather
than aligned with the surrounding code.  (They mostly appear at file
scope, so it's not usually an issue.)  It's perfectly valid to indent
the #define, but it's a bit misleading, since it implies that SIZE has
a scope (it doesn't, it's visible to the end of the translation unit).

With the "const int" declaration, buffer becomes a VLA (variable
length array).  VLAs don't exist in C90, do exist in C99, and are
optional in C11.  The code won't compile with "gcc -pedantic-errors".

Given the need to support C90, I suggest that the #define is still
the best way to define the constant.  You could use an enum hack:

    enum { size = 100 };
    void *buffer[size];

but that's a little obscure, and introduces an issue that's not
relevant to the backtrace() function.

-- 
Keith Thompson <Keith.S.Thompson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
