From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: null terminating byte man pages
Date: Sun, 19 May 2013 19:55:07 +0200
Message-ID: <519911FB.4070909@gmail.com>
References: <CAGc9Evdt3W-OtH3B5xyWPtuLkVMuob2rK2_QWhqV_+Ev0S67LA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9Evdt3W-OtH3B5xyWPtuLkVMuob2rK2_QWhqV_+Ev0S67LA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On 04/25/13 15:07, Jon Grant wrote:
> Hello
> 
> readdir (3) man page says:
> "the terminating null byte"
> 
> Could it be updated to follow "man strlen" page and say:
> 
> "the terminating null byte ('\0')"
> 
> Other pages only say "null byte", e.g. getdomainname
> http://man7.org/linux/man-pages/man2/setdomainname.2.html
> 
> Should they all be changed to clarify?
> 
> others: gethostname, readlink, stat, argz_add, asprintf, catgets,
> confstr, getcwd, getline,
> getlogin, memchr, pthread_setname_np, strerror, strfmon, strftime,
> sysconf, inotify,
> 
> wprintf - should also say ('\0') ?

So (1) there is some inconsistency in the pages with respect to this
point, but I'm not too worried about it and (2) C programmers should
know what a terminating null byte is. Therefore, I'm not really 
inclined to fix this in every case, but I did add the detail to 
these pages:

readdir.2
asprintf.3
catgets.3
getline.3
getlogin.3
pthread_setname_np.3
readdir.3
strerror.3
inotify.7

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
