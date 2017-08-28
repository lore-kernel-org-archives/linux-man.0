From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: man page update (fcntl(2) new set/get write hints)
Date: Mon, 28 Aug 2017 11:07:14 +0200
Message-ID: <02cf5c20-bb36-29e3-01e2-3a90e8272c70@redhat.com>
References: <25b8e025-d49b-e033-5ba3-f6967a6a970f@kernel.dk>
 <feffa54b-d1b4-02e3-5a24-0a8e51f96762@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <feffa54b-d1b4-02e3-5a24-0a8e51f96762-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/24/2017 12:41 AM, Michael Kerrisk (man-pages) wrote:
> +.TP
> +.BR F_GET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Returns the value of the read/write hint associated with the underlying inode
> +for the file descriptor.
> +.TP
> +.BR F_SET_RW_HINT " (\fIuint64_t\fP; since Linux 4.13)"
> +Sets the read/write hint value associated with the underlying inode for the
> +file descriptor.

Surely the arguments are of pointer type for reads *and* writes?

There is no convenient way 32-bit userspace can pass a 64-bit integer
through are variadic dispatcher interface such as ioctl/fcntl/futex.

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
