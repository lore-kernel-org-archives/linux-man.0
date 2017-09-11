From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man page update (fcntl(2) new set/get write hints)
Date: Mon, 11 Sep 2017 16:31:16 +0200
Message-ID: <CAKgNAkge+OG4FoMu-c-Q7b3P8EUqFzbmmhVNiaeDFHWWA6XWcA@mail.gmail.com>
References: <25b8e025-d49b-e033-5ba3-f6967a6a970f@kernel.dk>
 <feffa54b-d1b4-02e3-5a24-0a8e51f96762@gmail.com> <39f20b08-9a35-652e-4ae9-96f3cb8e5679@kernel.dk>
 <CAKgNAkizCBiky9QM0-oyP3taGKCDTjAP--SCgqZ3pC8Kz=PnPw@mail.gmail.com>
 <580f238c-4c3d-eddc-5330-19f8a971bce1@kernel.dk> <CAKgNAkhJysMFycC8xxjQ8s=+ABryEmWTFUopTWoan04icGibAw@mail.gmail.com>
 <6d17003b-87a1-43c8-87bf-80842b4fabf7@kernel.dk> <68b812bd-a861-2ed0-e207-fb0a9bbce923@gmail.com>
 <6ad54bed-75fa-5153-004e-c4a8a1c87a35@kernel.dk> <778a45d3-8bee-aa8b-86bd-c7e6cd7e5c60@gmail.com>
 <e281652b-44d7-1c59-35ea-63836d6532dd@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e281652b-44d7-1c59-35ea-63836d6532dd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jens,

Ping^2!

Cheers,

Michael


On 3 September 2017 at 02:45, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Jens,
>
> Ping!
>
> Cheers,
>
> Michael
>
>
> On 08/28/2017 11:16 PM, Michael Kerrisk (man-pages) wrote:
>> On 08/28/2017 10:15 PM, Jens Axboe wrote:
>>> On 08/28/2017 01:19 PM, Michael Kerrisk (man-pages) wrote:
>>>> Hi Jens,
>>>>
>>>> On 08/25/2017 10:55 PM, Jens Axboe wrote:
>>>>> On 08/25/2017 02:51 PM, Michael Kerrisk (man-pages) wrote:
>>>>>>>>>> Do you mean here "file descriptor" or "file description (i.e., t=
he
>>>>>>>>>> open file handle)? Maybe you mean the former, but I want to conf=
irm.
>>>>>>>>>
>>>>>>>>> I do mean file descriptor.
>>>>>>>>
>>>>>>>> So, what are the semantics if a file descriptor is duplicated usin=
g
>>>>>>>> dup(2) or similar? If I understand correctly, then the write lifet=
ime
>>>>>>>> hint has no effect for the new file descriptor, right?
>>>>>>>
>>>>>>> If it's dup(2)'ed, then the new file descriptor will refer to the s=
ame
>>>>>>> hints as the previous. See attached test file.
>>>>>>
>>>>>> But then isn't this exactly the point I asked about: are the hints
>>>>>> private to a file descriptor or are they associated with the open fi=
le
>>>>>> description (open file table entry, "struct file")? You said "I do
>>>>>> mean file descriptor", but actually I understand what you just said
>>>>>> now as "hints are associated with the open file description, which m=
ay
>>>>>> be referred to by multiple duplicated file descriptors". Can you
>>>>>> clarify?
>>>>>
>>>>> You are right, I misunderstood your original question. They do follow
>>>>> the file description. So the dup'ed one will return the same as the
>>>>> original, even if the hints on the original fd get modified. That is =
the
>>>>> expected behavior.
>>>>
>>>> So, I am still confused. I was wondering whether the hints are
>>>> associated with the open file description (OFD), rather than the
>>>> file descriptor. You said yes, then say that the dup'ed file
>>>> descriptor will have the same hints even if the hints on the
>>>> original file descriptor are modified. To me that sounds like:
>>>> the hints are associated with the file descriptor, and not the
>>>> OFD, and during dup(2) the hints are *copied* to the the new
>>>> file descriptor, with the result that after the dup(2) the hints
>>>> can be modified independently for the two file descriptors.
>>>>
>>>> Can you clarify please?
>>>
>>> No, that's not how it behaves. If you dup(2) the file descriptor, then
>>> the dup'ed descriptor will return the same hint as was set on the
>>> original.  If you change/clear the hint on the original, the dup'ed
>>> descriptor will now return the new hint.
>>
>> Okay -- thanks. I'd misunderstood your earlier words. Okay, I've
>> hacked this text to arrive at new text below. Could you please check
>> it? Also, there are some details that are still missing. Could you take
>> a look at the questions below please.
>>
>> [[[
>>     File read/write hints
>>        Write lifetime hints can be used to inform the  kernel  about  th=
e
>>        relative  expected  lifetime  of  writes on a given inode or via =
a
>>        particular open file description.  (See open(2) for an explanatio=
n
>>        of open file desriptions.)  In this context, the term "write life=
=E2=80=90
>>        time" means the expected time the data will live on media,  befor=
e
>>        being overwritten or erased.
>>
>>        An  application  may use the different hint values specified belo=
w
>>        to separate writes into different write classes, so that  multipl=
e
>>        users  or  applications  running  on a single storage back-end ca=
n
>>        aggregate their I/O patterns in  a  consistent  manner.   However=
,
>>        there are no functional semantics implied by these flags, and dif=
=E2=80=90
>>        ferent I/O classes can use the write lifetime hints  in  arbitrar=
y
>>        ways, so long as the hints are used consistently.
>>
>> QUESTIONS:
>> * What are write classes?
>> * What are I/O classes?
>> * What is the purpose of using read/write hints? I assume it's a
>>   performance point, but the text is not explicit about that.
>> * You variously wrote "read/write hints" and "write hints". Let's make
>>   it consistent. Which is the preferred term?
>>
>>        The  following  operations  can be applied to the file descriptor=
,
>>        fd:
>>
>>        F_GET_RW_HINT (uint64_t *; since Linux 4.13)
>>               Returns the value of the read/write  hint  associated  wit=
h
>>               the underlying inode referred to by fd.
>>
>>        F_SET_RW_HINT (uint64_t *; since Linux 4.13)
>>               Sets the read/write hint value associated with the underly=
=E2=80=90
>>               ing inode referred to by fd.
>>
>>        F_GET_FILE_RW_HINT (uint64_t *; since Linux 4.13)
>>               Returns the value of the read/write  hint  associated  wit=
h
>>               the open file description referred to by fd.
>>
>>        F_SET_FILE_RW_HINT (uint64_t *; since Linux 4.13)
>>               Sets  the  read/write  hint  value associated with the ope=
n
>>               file description referred to by fd.
>>
>>        If an open file description has not  been  assigned  a  read/writ=
e
>>        hint, then it shall use the value assigned to the inode, if any.
>>
>>        The following read/write hints are valid since Linux 4.13:
>>
>>        RWH_WRITE_LIFE_NOT_SET
>>               No specific hint has been set.  This is the default value.
>>
>>        RWH_WRITE_LIFE_NONE
>>               No  specific write lifetime is associated with this file o=
r
>>               inode.
>>
>>        RWH_WRITE_LIFE_SHORT
>>               Data written to this inode or via this open  file  descrip=
=E2=80=90
>>               tion is expected to have a short lifetime.
>>
>>        RWH_WRITE_LIFE_MEDIUM
>>               Data  written  to this inode or via this open file descrip=
=E2=80=90
>>               tion is expected to have a lifetime longer than data  writ=
=E2=80=90
>>               ten with RWH_WRITE_LIFE_SHORT.
>>
>>        RWH_WRITE_LIFE_LONG
>>               Data  written  to this inode or via this open file descrip=
=E2=80=90
>>               tion is expected to have a lifetime longer than data  writ=
=E2=80=90
>>               ten with RWH_WRITE_LIFE_MEDIUM.
>>
>>        RWH_WRITE_LIFE_EXTREME
>>               Data  written  to this inode or via this open file descrip=
=E2=80=90
>>               tion is expected to have a lifetime longer than data  writ=
=E2=80=90
>>               ten with RWH_WRITE_LIFE_LONG.
>>
>>        All  the  write-specific  hints are relative to each other, and n=
o
>>        individual absolute meaning should be attributed to them.
>> ]]]
>>
>> Cheers,
>>
>> Michael
>>
>>
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
