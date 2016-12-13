From: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Revised keyrings(7) man page for review
Date: Tue, 13 Dec 2016 14:20:37 +0000
Message-ID: <30566.1481638837@warthog.procyon.org.uk>
References: <a5615075-dd39-e206-cbce-385bed72473f@gmail.com> <CAKgNAkh9JLN4P+Fu+yRCNo96E3VwjYLRquuaf43XRWeuC7gnNw@mail.gmail.com> <51643019-bb42-4066-c824-c55b9e668ac6@man7.org> <25262.1481628931@warthog.procyon.org.uk> <9f32a79b-5795-bff4-b741-bf927a525149@gmail.com> <26913.1481636296@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a5615075-dd39-e206-cbce-385bed72473f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-ID: <30565.1481638837.1-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, keyrings-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>               The payload data may  be  stored  in  a  tmpfs  filesystem,
>               rather  than in kernel memory, if the data size exceeds the
>               overhead of storing the data in the  filesystem.   (Storing
>               the  data in a filesystem requires filesystem structures to
>               be allocated in the kernel.  The size of  these  structures
>               determines the size threshold above which the tmpfs storage
>               method is used.)  Since Linux  4.8,  the  payload  data  is
>               encrypted when stored in tmpfs, to prevent it being written
>               unencrypted into swap space.

"... thereby preventing it from being written unencrypted into the swapspace"?

David
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
