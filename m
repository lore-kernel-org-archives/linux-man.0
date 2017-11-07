From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: pkey_alloc/pkey_free semantics
Date: Tue, 7 Nov 2017 15:04:23 +0100
Message-ID: <1fb796d8-84dd-db82-2951-86d7e103a7c9@redhat.com>
References: <53ca4117-3694-45ac-3433-c9d3456e096b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53ca4117-3694-45ac-3433-c9d3456e096b-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/05/2017 12:39 PM, Florian Weimer wrote:

> Anyway, the important manpage fix for now would be to fix the 
> description of the flags and access_rights parameters.

One more thing:

The pkey_alloc system call returns EINVAL, not ENOSPC, if the system 
does not support memory protection keys (at least in the Intel 
implementation, have not checked POWER).

Thanks,
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
