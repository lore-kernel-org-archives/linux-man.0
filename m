From: Andrea Arcangeli <aarcange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Review request: draft ioctl_userfaultfd(2) manual page
Date: Wed, 3 May 2017 23:46:13 +0200
Message-ID: <20170503214613.GB30692@redhat.com>
References: <487b2c79-f99b-6d0f-2412-aa75cde65569@gmail.com>
 <9af29fc6-dce2-f729-0f07-a0bfcc6c3587@gmail.com>
 <20170322135423.GB27789@rapoport-lnx>
 <e8c5ca4a-0710-7206-b96e-10d171bda218@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <e8c5ca4a-0710-7206-b96e-10d171bda218-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Rapoport <rppt-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org" <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Apr 21, 2017 at 11:11:18AM +0200, Michael Kerrisk (man-pages) wrote:
> Hello Mike,
> Hello Andrea (we need your help!),

Sorry for not answering sooner! (I had a vacation last week)

> 
> On 03/22/2017 02:54 PM, Mike Rapoport wrote:
> >>        The  various  ioctl(2) operations are described below.  The UFFDIO_API,
> >>        UFFDIO_REGISTER, and UFFDIO_UNREGISTER operations are used to configure
> >>        userfaultfd behavior.  These operations allow the caller to choose what
> >>        features will be enabled and what kinds of events will be delivered  to
> >>        the application.  The remaining operations are range operations.  These
> >>        operations enable the calling application to resolve page-fault  events
> >>        in a consistent way.
> >>
> >>
> >>        ┌─────────────────────────────────────────────────────┐
> >>        │FIXME                                                │
> >>        ├─────────────────────────────────────────────────────┤
> >>        │Above: What does "consistent" mean?                  │
> >>        │                                                     │
> >>        └─────────────────────────────────────────────────────┘
> > 
> > Andrea, can you please help with this one?
> 
> Let's see what Andrea has to say.

I think it doesn't mean anything and I see you already removed it, fine!

> So, the thing that was not clear, but now I think I understand:
> 'features' is an input field where one can ask about supported features
> (but none are supported, before Linux 4.11). Is that correct? I've changed
> the text here to read:
> 
>        Before the call, the features field must be  initialized
>        to  zero.  In the future, it is intended that this field can be
>        used to ask whether particular features are supported.
> 
> Seem okay?

Yes, but in reality nothing has changed. Simply the kernels before
4.11 had no feature support at all.

===
       Starting from Linux 4.11, the features field can be used to ask
       whether particular features are supported and explicitly enable
       userfaultfd features that are disabled by default.  The kernel
       always reports all the available features in the features
       field.
=====	      

I would prefer if we removed this 4.11 difference here.

We should be able to describe it simply as:

"The features field can be used to ask whether particular features are
supported and explicitly enable userfaultfd features that are disabled
by default. The kernel always reports all the available features in
the features field."

The whole point of this feature flag thing, is so the app at runtime
can check if the feature is available and ask for it. The fact kernels
before 4.11 don't support any feature is a detail.

> > There's a check in uffdio_api call that the user is not trying to enable
> > any other functionality and it asserts that uffdio_api.featurs is zero [1].
> > Starting from 4.11 the features negotiation is different. Now uffdio_call
> > verifies that it can support features the application requested [2].
> 
> Okay.

I don't like the differentiation here between 4.11 and before, because
from user point of view nothing has changed.

I think this description is enough "       Since Linux 4.11, the
following feature bits may be set: " and no other mention of 4.11 is
needed in the manpage. It looks an unnecessary complication to the reader.

> 
> >>        The  kernel verifies that it can support the requested API version, and
> >>        sets the features and ioctls fields to bit masks representing  all  the
> >>        available features and the generic ioctl(2) operations available.  Cur‐
> >>        rently, zero (i.e., no feature bits) is placed in the  features  field.
> >>        The returned ioctls field can contain the following bits:
> >>
> >>
> >>        ┌─────────────────────────────────────────────────────┐
> >>        │FIXME                                                │
> >>        ├─────────────────────────────────────────────────────┤
> >>        │This  user-space  API  seems not fully polished. Why │
> >>        │are there not constants defined for each of the bit- │
> >>        │mask values listed below?                            │
> >>        └─────────────────────────────────────────────────────┘
> >>
> >>        1 << _UFFDIO_API
> >>               The UFFDIO_API operation is supported.
> >>
> >>        1 << _UFFDIO_REGISTER
> >>               The UFFDIO_REGISTER operation is supported.
> >>
> >>        1 << _UFFDIO_UNREGISTER
> >>               The UFFDIO_UNREGISTER operation is supported.
> > 
> > Well, I tend to agree. I believe the original intention was to use the
> > OR'ed mask, like UFFD_API_IOCTLS.
> > Andrea, can you add somthing?
> 
> Yes, Andrea, please!

I agree it can be polished, but that's not something the manpage can
fix... For now the above is correct.

So about the error retvals I reviewed the final manpage from git which
is the latest version.


> >>
> >>        EINVAL The userfaultfd has already been  enabled  by  a  previous  UFF‐
> >>               DIO_API operation.
> >>
> >>        EINVAL The  API  version requested in the api field is not supported by
> >>               this kernel, or the features field was not zero.
> >>
> >>               ┌─────────────────────────────────────────────────────┐
> >>               │FIXME                                                │
> >>               ├─────────────────────────────────────────────────────┤
> >>               │In the above error case, the  returned  'uffdio_api' │
> >>               │structure  zeroed out. Why is this done? This should │
> >>               │be explained in the manual page.                     │
> >>               │                                                     │
> >>               └─────────────────────────────────────────────────────┘
> >  
> > In my understanding the uffdio_api structure is zeroed to allow the caller
> > to distinguish the reasons for -EINVAL.
> 
> Andrea, can you please help here?

It is zeroed out just for robustness, it's a slow path. If userland by
mistake won't check -EINVAL but it checks uffdio_api.features to be
set or uffdio_api.ioctls or uffdio_api.api after the UFFDIO_API ioctl
returns, it will have a chance to catch the failure (it won't risk to
parse random uninitialized values at least).

I don't think it should be documented the uffdio_api is zeroed out or
if it is documented, we should say userland shouldn't depend on it and
it's done just for robustness.

The normal correct way to catch an error is to check -EINVAL, after
getting -EINVAL the contents of uffdio_api should be ignored by
userland.

> >>    UFFDIO_REGISTER
> >>        (Since Linux 4.3.)  Register a memory  address  range  with  the  user‐
> >>        faultfd  object.   The  argp argument is a pointer to a uffdio_register
> >>        structure, defined as:
> >>
> >>            struct uffdio_range {
> >>                __u64 start;    /* Start of range */
> >>                __u64 len;      /* Length of rnage (bytes) */
> >>            };
> >>
> >>            struct uffdio_register {
> >>                struct uffdio_range range;
> >>                __u64 mode;     /* Desired mode of operation (input) */
> >>                __u64 ioctls;   /* Available ioctl() operations (output) */
> >>            };
> >>
> >>
> >>        The range field defines a memory range starting at start and continuing
> >>        for len bytes that should be handled by the userfaultfd.
> >>
> >>        The  mode  field  defines the mode of operation desired for this memory
> >>        region.  The following values may be bitwise  ORed  to  set  the  user‐
> >>        faultfd mode for the specified range:
> >>
> >>        UFFDIO_REGISTER_MODE_MISSING
> >>               Track page faults on missing pages.
> >>
> >>        UFFDIO_REGISTER_MODE_WP
> >>               Track page faults on write-protected pages.
> >>
> >>        Currently, the only supported mode is UFFDIO_REGISTER_MODE_MISSING.
> >>
> >>        If the operation is successful, the kernel modifies the ioctls bit-mask
> >>        field to indicate which ioctl(2) operations are available for the spec‐
> >>        ified range.  This returned bit mask is as for UFFDIO_API.
> >>
> >>        This ioctl(2) operation returns 0 on success.  On error, -1 is returned
> >>        and errno is set to indicate the cause of the error.   Possible  errors
> >>        include:
> >>
> >>
> >>        ┌─────────────────────────────────────────────────────┐
> >>        │FIXME                                                │
> >>        ├─────────────────────────────────────────────────────┤
> >>        │Is the following error list correct?                 │
> >>        │                                                     │
> >>        └─────────────────────────────────────────────────────┘
> > 
> > Here again it maybe -EFAULT to indicate copy_{from,to}_user failure.
> > And, UFFDIO_REGISTER may return -ENOMEM if the process is exiting and the
> > mm_struct has gone by the time userfault grabs it. 
> 
> Okay -- added EFAULT. I think I'll skip ENOMEM for the moment, but
> will note the possibility in the page source.

There is also ENOMEM as result of split_vma failing, and it isn't the
cleanest thing that it means both real OOM or out of vmas
(mm->map_count >= sysctl_max_map_count, not real OOM) and that the
process is exiting or there isn't a single vma in the mm.

If there's one vma but it isn't in the range we return -EINVAL so we
could return probably -EINVAL if it's exiting or if there isn't a
single vma in the mm. And leave -ENOMEM for split_vma only.

In general -EINVAL is programmer error of some kind, -ENOMEM is
returned in memory related cases that trigger at runtime, however if
the process is exiting it's debatable if it's programmer error too
which is why I think we could return -EINVAL there.

I'd expect userland to threat -ENOMEM and -EINVAL about the same way.

> >>        EINVAL There was no mapping in the specified address range.
> >>
> >>    UFFDIO_COPY
> >>        (Since  Linux 4.3.)  Atomically copy a continuous memory chunk into the
> >>        userfault registered range and optionally wake up the  blocked  thread.
> >>        The  source  and  destination addresses and the number of bytes to copy
> >>        are specified by the src, dst, and len fields of the uffdio_copy struc‐
> >>        ture pointed to by argp:
> >>
> >>            struct uffdio_copy {
> >>                __u64 dst;    /* Source of copy */
> >>                __u64 src;    /* Destinate of copy */
> >>                __u64 len;    /* Number of bytes to copy */
> >>                __u64 mode;   /* Flags controlling behavior of copy */
> >>                __s64 copy;   /* Number of bytes copied, or negated error */
> >>            };
> >>
> >>        The  following value may be bitwise ORed in mode to change the behavior
> >>        of the UFFDIO_COPY operation:
> >>
> >>        UFFDIO_COPY_MODE_DONTWAKE
> >>               Do not wake up the thread that waits for page-fault resolution
> >>
> >>        The copy field is used by the kernel to return the number of bytes that
> >>        was actually copied, or an error (a negated errno-style value).
> >>
> >>
> >>        ┌─────────────────────────────────────────────────────┐
> >>        │FIXME                                                │
> >>        ├─────────────────────────────────────────────────────┤
> >>        │Above:  Why is the 'copy' field used to return error │
> >>        │values?  This should  be  explained  in  the  manual │
> >>        │page.                                                │
> >>        └─────────────────────────────────────────────────────┘
> > 
> > Andrea, can you help with this one, please?
> 
> Yes, Andrea, please.

Well not just for error values. copy also tells how much did it copy
if a signal made it return short with -EINTR or some other error
happened in the middle of the copy after we already did some
copying-progress.

Writing any other error into .copy (and not only writing positive
values there) is for robustness in case userland won't check the ioctl
retval but nobody should depend on it. After the ioctl returns an
error userland should not check the uffdio_copy structure at all.

The thing to document is the amount of bytes successfully copied in
uffdio_copy.copy (which may be a short copy and in turn must be
checked... unless one knows the len matches the arch PAGE_SIZE but
it's still safer to check the uffdio_copy.copy field and be
consistent).

One more relevant retvals for UFFDIO_COPY and UFFDIO_ZEROPAGE that I
noticed is missing in the current manpage, is
-EEXIST. UFFDIO_COPY/ZEROPAGE don't behave like mmap/mremap,
UFFDIO_COPY/ZEROPAGE will never teardown any existing established
mapping to guarantee even if the user has race condition in its code,
there's no risk of silent memory corruption, instead a meaningful
error is returned by UFFDIO_COPY/ZEROPAGE. For example if two
UFFDIO_COPY run concurrently on the same page, only the first one will
succeed, the second will return -EEXIST and only the first page will
be copied and no memory corruption can happen this way (furthermore
the programmer can be notified of the race condition in the code which
might even be intentional, but more likely is not).

> >>        ┌─────────────────────────────────────────────────────┐
> >>        │FIXME                                                │
> >>        ├─────────────────────────────────────────────────────┤
> >>        │Why  is  the  'zeropage'  field used to return error │
> >>        │values?  This should  be  explained  in  the  manual │
> >>        │page.                                                │
> >>        └─────────────────────────────────────────────────────┘
> 
> Help is still needed for this FIXME!

Same as uffdio_copy.copy: because we've to return the number of pages
that have been zeroed out in case we run into an error (signal -EINTR
or -EEXIST etc..) after we already succeeded partially on a couple of
pages. So we may as well write the error in the same field if no pages
were zeroed out. This way the program will misbehave more than if that
field is left untouched (and it could even be random in such case as
it can be left uninitialized by userland). Clearly it only makes a
difference if the programmer forgets to check the UFFDIO_ZEROPAGE
ioctl retval and the retval must always be checked, so again, this is
only for robustness.

Awesome manpage! Super useful, it's fundamental to have a manpage
especially when the syscall is not simple and strightforward in
functionality.

Thanks!
Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
