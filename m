From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: symlink.2 clarification of ENOENT
Date: Sun, 12 Apr 2015 09:57:01 +0200
Message-ID: <CAKgNAki-xW6OBnOhw1sm8EKvwVmievwvuu3V+JgaZt29K5NUqA@mail.gmail.com>
References: <CAGc9EvcK9fkW+zmDvbQD00h57ZsJ6o4XX=ojM+MQ+jr46FbniA@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGc9EvcK9fkW+zmDvbQD00h57ZsJ6o4XX=ojM+MQ+jr46FbniA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Jonny,

On 9 October 2014 at 13:22, Jonny Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi Michael
>
> http://man7.org/linux/man-pages/man2/symlink.2.html
>
> I saw that [linkpath] being the empty string "" also returns ENOENT. I
> feel worth clariying:
>
> Current text:
> "ENOENT A directory component in linkpath does not exist or is a
>               dangling symbolic link, or target is the empty string."
>
> Proposed new text:
> "ENOENT target or linkpath are empty strings. Or a directory component
> in linkpath does not exist or is a dangling symbolic link."

Thanks. Yes, POSIX actually explicitly notes that ENOENT occurs if the
second argument is an empty string. I added this point to the man
page.

Cheers,

Michael


> I tested with
>     result = symlink("", NULL);
>     printf("symlink: '' NULL: %d, %d, '%s'\n", result, errno, strerror(errno));
>
> Output:
> symlink: '' NULL: -1, 2, 'No such file or directory'
>
> --
> Jonny  jg-hus3n9K41k0@public.gmane.org



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
