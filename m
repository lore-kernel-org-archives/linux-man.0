From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] italic formatting fix in argz_add.3
Date: Thu, 01 Aug 2013 11:29:25 +0200
Message-ID: <51FA2A75.3020805@gmail.com>
References: <CALhU9tk_vuKDR+syrjVUFWbG7W3t5FjiwD2kDScQMdJhkW_SBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tk_vuKDR+syrjVUFWbG7W3t5FjiwD2kDScQMdJhkW_SBw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/30/13 22:20, Akihiro MOTOKI wrote:
> There are several inappropriate italic formatting in argz_add.3.

I believe this was already fixed by commit 
ea01d8861848f21f69eac15ceaeabf88426359d7

Thanks,

Michael



> diff --git a/manual/LDP_man-pages/original/man3/argz_add.3
> b/manual/LDP_man-pages/original/man3/argz_add.3
> index 9032cf1..666999e 100644
> --- a/manual/LDP_man-pages/original/man3/argz_add.3
> +++ b/manual/LDP_man-pages/original/man3/argz_add.3
> @@ -85,9 +85,9 @@ delimiter \(aq:\(aq.
>  .LP
>  .BR argz_append ()
>  appends the argz vector
> -.RI ( buf ,\ buf_len )
> +.RI ( buf ", " buf_len )
>  after
> -.RI ( *argz ,\ *argz_len )
> +.RI ( *argz ", " *argz_len )
>  and updates
>  .IR *argz
>  and
> @@ -100,7 +100,7 @@ will be increased by
>  .BR argz_count ()
>  counts the number of strings, that is,
>  the number of null bytes (\(aq\\0\(aq), in
> -.RI ( argz ,\ argz_len ).
> +.RI ( argz ", " argz_len ).
>  .LP
>  .BR argz_create ()
>  converts a UNIX-style argument vector
> @@ -108,13 +108,13 @@ converts a UNIX-style argument vector
>  terminated by
>  .IR "(char\ *)\ 0" ,
>  into an argz vector
> -.RI ( *argz ,\ *argz_len ).
> +.RI ( *argz ", " *argz_len ).
>  .LP
>  .BR argz_create_sep ()
>  converts the null-terminated string
>  .I str
>  into an argz vector
> -.RI ( *argz ,\ *argz_len )
> +.RI ( *argz ", " *argz_len )
>  by breaking it up at every occurrence of the separator
>  .IR sep .
>  .LP
> @@ -122,7 +122,7 @@ by breaking it up at every occurrence of the separator
>  removes the substring pointed to by
>  .I entry
>  from the argz vector
> -.RI ( *argz ,\ *argz_len )
> +.RI ( *argz ", " *argz_len )
>  and updates
>  .I *argz
>  and
> @@ -132,7 +132,7 @@ and
>  is the opposite of
>  .BR argz_create ().
>  It takes the argz vector
> -.RI ( argz ,\ argz_len )
> +.RI ( argz ", " argz_len )
>  and fills the array starting at
>  .I argv
>  with pointers to the substrings, and a final NULL,
> @@ -151,7 +151,7 @@ It inserts the argument
>  at position
>  .I before
>  into the argz vector
> -.RI ( *argz ,\ *argz_len )
> +.RI ( *argz ", " *argz_len )
>  and updates
>  .I *argz
>  and
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
