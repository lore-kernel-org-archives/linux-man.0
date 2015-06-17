From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] hosts.equiv.5: Fix format, clarify IdM needs, and provide
 examples.
Date: Wed, 17 Jun 2015 10:50:27 +0200
Message-ID: <558134D3.2010603@gmail.com>
References: <55615A71.4010600@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55615A71.4010600-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arjun Shankar <arjun-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Carlos,

I've applied this patch, making a number of formatting changes along
the way. You might want to review the (rendered) result.

One other comment bewlow
On 05/24/2015 06:58 AM, Carlos O'Donell wrote:
> Arjun,
> 
> As promised. Does this look good to you?
> 
> Michael,
> 
> In some recent work with a Red Hat customer I had the opportunity
> to discuss the fine nuances of the ruserok() function and related
> API which are used to implement rlogin and rsh.
> 
> It came to my attention after working with QE on some automated
> internal testing that there were no good examples in the hosts.equiv
> manual page showing how the format was supposed to work for this
> file and for ~/.rhosts, worse the "format" line showed that there
> should be spaces between arguments when that would clearly lead
> to incorrect behaviour. In addition some things that the format
> allows you to write are just wrong like "-host -user" which makes
> no sense since the host is already rejected, and should be written
> as "host -user" instead. I added notes in the example to make it
> clear that "-host -user" is invalid.
> 
> I fixed three things:
> 
> (a) The format line.
> - Either +, or [-]hostname, or +@netgrp or -@netgrp.
> - Either +, or [-]username, or +@netgrp or -@netgrp.
> - You must specify something in the hostname portion so remove
>   optional brackets.
> 
> (b) Clarify language around credentials
> - If the host is not trusted you must provide credentials to
>   the login system and that could be anything really and it
>   depends on your configuration e.g. PAM or whatever IdM you have.
> 
> (c) Provide real-world examples
> - Provide several real world examples and some corner case
>   examples for how you would write something. Hopefully others
>   can add examples as they see fit.
> 
> Patch applies to trunk.
> 
> Signed-off-by: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> 
> diff --git a/man5/hosts.equiv.5 b/man5/hosts.equiv.5
> index 89d0b4a..c8e85ac 100644
> --- a/man5/hosts.equiv.5
> +++ b/man5/hosts.equiv.5
> @@ -22,7 +22,7 @@ supplying a password.
>  .PP
>  The file uses the following format:
>  .TP
> -\fI[ + | \- ]\fP \fI[hostname]\fP \fI[username]\fP
> +\fI+|[\-]hostname|+@netgroup|\-@netgroup\fP \fI[+|[\-]username|+@netgroup|\-@netgroup]\fP
>  .PP
>  The
>  .I hostname
> @@ -37,9 +37,9 @@ If the plus sign is used alone, it allows any host to access your system.
>  You can explicitly deny access to a host by preceding the
>  .I hostname
>  by a minus (\-) sign.
> -Users from that host must always supply a password.
> -For security reasons you should always use the FQDN of the hostname and
> -not the short hostname.
> +Users from that host must always supply additional credentials,
> +including possibly a password. For security reasons you should always
> +use the FQDN of the hostname and not the short hostname.
>  .PP
>  The
>  .I username
> @@ -81,6 +81,112 @@ character which means "any host" only when the word
>  is added to the auth component line in your PAM file for
>  the particular service
>  .RB "(e.g., " rlogin ).
> +.SH EXAMPLE
> +Here are some example
> +.I /etc/host.equiv
> +or
> +.I ~/.rhosts
> +files:
> +.TP
> +Allow any user to login from any host:
> +.LP
> +.RS 4
> +.TP
> ++
> +.PD
> +.RE
> +.TP
> +Allow any user from host with a matching local account to login:
> +.LP
> +.RS 4
> +.TP
> +host
> +.PD
> +.RE
> +.PP
> +Note: The use of
> +.B +host
> +is never a valid syntax, including attempting to specify that any user from the host is allowed.
> +.TP
> +Allow any user from host to login:
> +.LP
> +.RS 4
> +.TP
> +host +
> +.PD
> +.RE
> +.PP
> +Note: This is distinct from the previous example since it does not require a matching local account.
> +.TP
> +Allow user from host to login:
> +.LP
> +.RS 4
> +.TP
> +host user
> +.PD
> +.RE
> +.TP
> +Allow all users with matching local accounts from host to login except for baduser:
> +.LP
> +.RS 4
> +.PD 0
> +.TP
> +host -baduser
> +.TP
> +host
> +.PD
> +.RE
> +.TP
> +Deny all users from host:
> +.LP
> +.RS 4
> +.TP
> +-host
> +.PD
> +.RE
> +.PP
> +Note: The use of
> +.B -host -user
> +is never a valid syntax, including attempting to specify that a particular user from the host is not trusted.
> +.TP
> +Allow all users with matching local accounts in all hosts in the netgroup:
> +.LP
> +.RS 4
> +.TP
> ++@netgroup
> +.PD
> +.RE
> +.TP
> +Disallow all users in all hosts in the netgroup:
> +.LP
> +.RS 4
> +.TP
> +-@netgroup
> +.PD
> +.RE
> +.TP
> +Allow all users in netgroup to login from host:
> +.LP
> +.RS 4
> +.TP
> +host +@netgroup
> +.PD
> +.RE
> +.TP
> +Allow all users with matching local accounts in all hosts in the netgroup except baduser:
> +.LP
> +.RS 4
> +.PD 0
> +.TP
> ++@netgroup -baduser
> +.TP
> ++@netgroup
> +.PD
> +.RE
> +.TP
> +Note: The deny statements must always preceed the allow statements because the file is processed one line at a time.

This last explanation feels incomplete. Should it not be something like:

   The deny statements must always precede the allow statements 
   because the file is processed sequentially until the first
   matching rule is found.

?

> +
> +
>  .SH SEE ALSO
>  .BR rhosts (5),
>  .BR rlogind (8),

Cheers,

Michael
 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
