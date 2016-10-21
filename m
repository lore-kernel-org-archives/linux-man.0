From: Vince Weaver <vincent.weaver@maine.edu>
Subject: Re: [PATCH 2/2] perf_event_open.2: Document write_backward
Date: Fri, 21 Oct 2016 17:25:40 -0400 (EDT)
Message-ID: <alpine.DEB.2.20.1610211716280.16183@macbook-air>
References: <1477049893-143199-1-git-send-email-wangnan0@huawei.com> <1477049893-143199-2-git-send-email-wangnan0@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477049893-143199-2-git-send-email-wangnan0@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wang Nan <wangnan0@huawei.com>
Cc: mtk.manpages@gmail.com, pi3orama@163.com, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, lizefan@huawei.com, vincent.weaver@maine.edu
List-Id: linux-man@vger.kernel.org

On Fri, 21 Oct 2016, Wang Nan wrote:

>            context_switch :  1,  /* context switch data */
> -
> -          __reserved_1   : 37;
> +          write_backward :  1,  /* Write ring buffer from end to beginning */
> +          __reserved_1   : 36;

This removes a blank line, not sure if intentional or not.

> +.IR "write_backward" " (since Linux 4.6)"

It didn't committed until Linux 4.7 from what I can tell?

> +This makes the resuling event use a backward ring-buffer, which
resulting

> +writes samples from the end of the ring-buffer.
> +
> +It is not allowed to connect events with backward and forward
> +ring-buffer settings together using
> +.B PERF_EVENT_IOC_SET_OUTPUT.
> +
> +Backward ring-buffer is useful when the ring-buffer is overwritable
> +(created by readonly
> +.BR mmap (2)
> +). 

A ring buffer is over-writable when it is mmapped readonly?
Is this a hard requirement?
Can you set the read-backwards bit if not mapped readonly?

Otherwise the documentation seems reasonable.

Reviewed-by: Vince Weaver <vincent.weaver@maine.edu>
