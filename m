From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] proc(5): clarify the root symlink and mount namespaces
Date: Fri, 7 Oct 2016 22:50:20 +0200
Message-ID: <aa5443c2-34a9-b77d-0e13-dc5dba4ca0e8@gmail.com>
References: <20161006013609.17481-1-vapier@gentoo.org>
 <20161006172322.3253-1-vapier@gentoo.org>
 <03f48447-e197-fb88-c7fd-ec8c01c38cf7@gmail.com>
 <20161007192100.GY21655@vapier.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161007192100.GY21655-UgUKS2FnFs9+urZeOPWqwQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/07/2016 09:21 PM, Mike Frysinger wrote:
> On 07 Oct 2016 14:33, Michael Kerrisk (man-pages) wrote:
>> On 10/06/2016 07:23 PM, Mike Frysinger wrote:
>>> If the target process is in a different mount namespace, the root symlink
>>> actually shows that view of the filesystem.  As an example:
>>>  /* Terminal 1 */
>>>  $ unshare -Urnm
>>>  # mount -t tmpfs tmpfs /etc
>>>  # mount --bind /bin /dev
>>>  # echo $$
>>>  17168
>>>
>>>  /* Terminal 2 */
>>>  # ls /etc                          # Normal view of /etc files.
>>>  # ls /proc/17168/root/etc          # Empty view of the tmpfs.
>>>  # ls /dev                          # Normal view of /dev files.
>>>  # ls /proc/17168/root/dev          # Contents of /bin files.
>>
>> Thanks for the patch! And thanks for the commit message, which is I think
>> actually useful text for the man page itself, so I added it (in somewhat
>> modified form) to the page itself.
> 
> looks like some formatting is off ?

Thanks, Mike. Patch applied.

Cheers,

Michael

> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -1525,7 +1525,7 @@ and in that shell we create some new mount points:
>  $ \fBPS1='sh1# ' unshare \-Urnm\fP
>  sh1# \fBmount \-t tmpfs tmpfs /etc\fP  # Mount empty tmpfs at /etc
>  sh1# \fBmount \-\-bind /usr /dev\fP     # Mount /usr at /dev
> -sh1# \fBecho $$
> +sh1# \fBecho $$\fP
>  27123
>  .in
>  .fi
> @@ -1533,10 +1533,10 @@ sh1# \fBecho $$
>  In a second terminal window, in the initial mount namespace,
>  we look at the contents of the corresponding mounts in
>  the initial and new namespaces:
> -    
> +
>  .nf
>  .in +4n
> -$ \fBPS1='sh2# ' sudo sh
> +$ \fBPS1='sh2# ' sudo sh\fP
>  sh2# \fBls /etc | wc \-l\fP                  # In initial NS
>  309
>  sh2# \fBls /proc/27123/root/etc | wc \-l\fP  # /etc in other NS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
