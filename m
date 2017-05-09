From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rpc.5: ffix
Date: Tue, 9 May 2017 19:04:21 +0200
Message-ID: <ff6bcd0d-a632-c92a-4ccb-1cee2c8056ac@gmail.com>
References: <20170506032620.2jjq5almd6pgf2bd@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170506032620.2jjq5almd6pgf2bd-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Branden,

On 05/06/2017 05:26 AM, G. Branden Robinson wrote:
> Is there a recommended best practice for itemized (but not enumerated)
> lists?  I don't know that my own is widely shared, so I did not make
> such a change here.

Not really any standard, but the existing formatting is certainly suboptimal.
I applied your patch, and then made a change more or less as you suggest
below.

Cheers,

Michael


> But if I were to do so, I would either recast this page's 3-item list
> into prose or use the indented paragraph macro with a bullet symbol for
> a tag:
> 
> .IP \(bu
> name of server for the RPC program
> .IP \(bu
> RPC program number
> .IP \(bu
> aliases
> 
> Of course,
> 
> .TP
> \(bu
> name of server for the RPC program
> [etc.]
> 
> would be equivalent.
> 
> Any advice?
> 
>> SNIP<
> 
> rpc.5: ffix
> 
> * Remove nop argument from HP macros.
> * Remove nop DT macro.
> * Replace LP macro with more commonly-used PP macro.
> 
> The above do not change the output whatsoever (confirmed with -Z).
> 
> * Use .I macro instead of font escapes, obtaining italic correction.
> 
> To see the above distinction, use -Tps, -Tpdf, or similar before and
> after the change.
> 
> diff --git a/man5/rpc.5 b/man5/rpc.5
> index 44b5acb0e..49831fd78 100644
> --- a/man5/rpc.5
> +++ b/man5/rpc.5
> @@ -16,25 +16,26 @@ The
>  file contains user readable names that
>  can be used in place of RPC program numbers.
>  Each line has the following information:
> -.HP 10
> +.HP
>  name of server for the RPC program
>  .br
>  .ns
> -.HP 10
> +.HP
>  RPC program number
>  .br
>  .ns
> -.HP 10
> +.HP
>  aliases
> -.LP
> +.PP
>  Items are separated by any number of blanks and/or
>  tab characters.
>  A \(aq#\(aq indicates the beginning of a comment; characters from
>  the \(aq#\(aq to the end of the line are not interpreted by routines
>  which search the file.
> -.LP
> -Here is an example of the \fI/etc/rpc\fP file from the Sun RPC Source
> -distribution.
> +.PP
> +Here is an example of the
> +.I /etc/rpc
> +file from the Sun RPC Source distribution.
>  .ft CW
>  .nf
>  #
> @@ -72,7 +73,6 @@ nsed            100038
>  nsemntd         100039
>  .fi
>  .ft
> -.DT
>  .SH FILES
>  .TP
>  .I /etc/rpc
> 
> Regards,
> Branden
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
