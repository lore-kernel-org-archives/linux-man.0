From: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mallinfo(3) man page for review
Date: Sat, 05 May 2012 23:49:44 -0400
Message-ID: <4FA5F4D8.8070502@gmail.com>
References: <CAKgNAkg2CKaEsOERkLyhsJ9N9nEpCm7oe_XzMBE1XBB_KkDoiQ@mail.gmail.com> <CAHGf_=r-TdDutTEvmmVRGyzKA_0Txh5gMRLJ6nNu1GZnjsiOxg@mail.gmail.com> <CAKgNAkjFUOa+FVA9zgQX6aVUQ6hocfvFWB71EihuyznJG7vLVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjFUOa+FVA9zgQX6aVUQ6hocfvFWB71EihuyznJG7vLVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

(5/5/12 5:50 PM), Michael Kerrisk (man-pages) wrote:
> Motohiro,
>
> Thank you for taking the time to look at this.
>
> On Sun, May 6, 2012 at 9:25 AM, KOSAKI Motohiro
> <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>> Hi
>>
>> On Fri, May 4, 2012 at 8:08 PM, Michael Kerrisk (man-pages)
>> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  wrote:
>>> I've written the man page page below to document glibc's mallinfo(3=
).
>>> Review comments welcome!
>>>
>>> Cheers,
>>>
>>> Michael
>>
>> I don't find any issue. a few nit are below.
>>
>>
>>> .TP 10
>>> .I arena
>>> The total amount of memory allocated by means other than
>>> .BR mmap (2)
>>> (i.e., memory allocated on the heap).
>>> This figure includes both in-use blocks and blocks on the free list=
=2E
>>> .TP
>>> .I ordblks
>>> The number of ordinary (i.e., non-fastbin) free blocks.
>>> .TP
>>> .I smblks
>>> The number of fastbin free blocks (see
>>> .BR mallopt (3)).
>>
>> It would be nice if a meaning of fastbin was described here.
>> It is allocation cache (for increasing cpu cache hit ratio) from
>> point of bird view.
>
> In the new mallopt(3) that is part of the next man-pages release,
> there is this text on fastbins:
>
>         M_MXFAST (since glibc 2.3)
>                Set the upper limit for memory allocation requests  th=
at
>                are  satisfied  using "fastbins".  (The measurement un=
it
>                for this parameter  is  bytes.)   Fastbins  are  stora=
ge
>                areas that hold deallocated blocks of memory of the sa=
me
>                size without merging adjacent free  blocks.   Subseque=
nt
>                reallocation  of  blocks of the same size can be handl=
ed
>                very quickly by allocating from  the  fastbin,  althou=
gh
>                memory fragmentation and the overall memory footprint =
of
>                the program can increase.  The default  value  for  th=
is
>                parameter  is  64*sizeof(size_t)/4  (i.e.,  64 on 32-b=
it
>                architectures).  The range for this parameter  is  0  =
to
>                80*sizeof(size_t)/4.  Setting M_MXFAST to 0 disables t=
he
>                use of fastbins.
>
> Probably this is sufficient?

Yes, very good. can you please refer mallopt here?


>>> .TP
>>> .I hblks
>>> The number of blocks currently allocated using
>>> .BR mmap (2).
>>
>> It would be nice if glibc malloc try to allocate memory by using mma=
p directly
>> if size is greater than MMAP_THRESHOLD.
>>
>> Also nice if refer mallopt and MMAP_THRESHOLD.
>
> Good idea. I added:
>
> [[
> (See the discussion of
> .B M_MMAP_THRESHOLD
> in
> .BR mallopt (3).)
> ]]
>
> In the new mallopt(3) page, there is then this text:
>
>         M_MMAP_THRESHOLD
>                For allocations greater than or equal to the limit spe=
c=E2=80=90
>                ified  (in bytes) by M_MMAP_THRESHOLD that can't be sa=
t=E2=80=90
>                isfied from the free list, the  memory-allocation  fun=
c=E2=80=90
>                tions  employ  mmap(2) instead of increasing the progr=
am
>                break using sbrk(2).
>
>                Allocating memory  using  mmap(2)  has  the  significa=
nt
>                advantage that the allocated memory blocks can always =
be
>                independently released back to  the  system.   (By  co=
n=E2=80=90
>                trast,  the  heap can be trimmed only if memory is fre=
ed
>                at the top end.)  On the other hand, there are some di=
s=E2=80=90
>                advantages  to  the use of mmap(2): deallocated space =
is
>                not placed on the free list for reuse by  later  alloc=
a=E2=80=90
>                tions;  memory may be wasted because mmap(2) allocatio=
ns
>                must be page-aligned; and the kernel  must  perform  t=
he
>                expensive  task  of  zeroing  out  memory  allocated v=
ia
>                mmap(2).  Balancing these factors  leads  to  a  defau=
lt
>                setting of 128*1024 for the M_MMAP_THRESHOLD parameter=
=2E
>
>                The  lower  limit  for  this  parameter is 0.  The upp=
er
>                limit is DEFAULT_MMAP_THRESHOLD_MAX: 512*1024 on  32-b=
it
>                systems or 4*1024*1024*sizeof(long) on 64-bit systems.
>
>                Note:  Nowadays,  glibc uses a dynamic mmap threshold =
by
>                default.   The  initial  value  of  the   threshold   =
is
>                128*1024,  but  when  blocks  larger  than  the  curre=
nt
>                threshold and less than or equal to DEFAULT_MMAP_THRES=
H=E2=80=90
>                OLD_MAX  are freed, the threshold is adjusted upwards =
to
>                the size of the freed block.  When dynamic mmap  thres=
h=E2=80=90
>                olding is in effect, the threshold for trimming the he=
ap
>                is also dynamically adjusted to  be  twice  the  dynam=
ic
>                mmap  threshold.  Dynamic adjustment of the mmap thres=
h=E2=80=90
>                old  is  disabled  if  any  of   the   M_TRIM_THRESHOL=
D,
>                M_TOP_PAD, M_MMAP_THRESHOLD, or M_MMAP_MAX parameters =
is
>                set.

very nice!

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
