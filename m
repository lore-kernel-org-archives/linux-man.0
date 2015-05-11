From: Jian Wen <wenjianhn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] packet.7: Fix description of binding a packet socket to
 an interface
Date: Mon, 11 May 2015 10:05:37 +0800
Message-ID: <CAMXzGWLWQ2urY1F344Qq0681DPwU9WQhJKKp72ph8QwgBJJtUg@mail.gmail.com>
References: <CAMXzGWJodsZjNnYj-MaeEDuaPE=t4ig=3vk=WiArJ3aMtATNsw@mail.gmail.com>
 <554F3CBC.90503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <554F3CBC.90503-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cortland Setlow <cortland.setlow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Cool!

Thanks.

On Sun, May 10, 2015 at 7:10 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello =E6=96=87=E5=89=91,
>
> On 08/11/2011 06:04 PM, =E6=96=87=E5=89=91 wrote:
>> As mentioned in packet(7), "Only  the  sll_protocol  and  the  sll_i=
findex
>> address fields are used for purposes of binding."
>> But in my test, sll_family is also used for binding a packet socket =
to an
>> interface.
>
> I'm catching up with some very old mail.
>
> I've applied your patch (for a problem that Cortland also reported).
> Thank you for sending it, and sorry that it sat on the floor for so
> long.
>
> Cheers,
>
> Michael
>
>
>> My enviroment:  2.6.38-10-generic Ubuntu-11.04 i686
>>
>> Against man-pages 3.33.
>>
>> Signed-off-by: Jian Wen
>>
>> ---
>>  man7/packet.7 |   18 ++++++++----------
>>  1 files changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/man7/packet.7 b/man7/packet.7
>> index 5e35ae2..3de2550 100644
>> --- a/man7/packet.7
>> +++ b/man7/packet.7
>> @@ -84,11 +84,14 @@ To only get packets from a specific interface us=
e
>>  specifying an address in a
>>  .I struct sockaddr_ll
>>  to bind the packet socket to an interface.
>> -Only the
>> -.I sll_protocol
>> -and the
>> -.I sll_ifindex
>> -address fields are used for purposes of binding.
>> +Fields used for binding are
>> +.IR sll_family (should
>> +be
>> +.BR AF_PACKET ),
>> +.IR sll_protocol ,
>> +and
>> +.IR sll_ifindex .
>> +
>>
>>  The
>>  .BR connect (2)
>> @@ -166,11 +169,6 @@ The other fields should be 0.
>>  and
>>  .I sll_pkttype
>>  are set on received packets for your information.
>> -For bind only
>> -.I sll_protocol
>> -and
>> -.I sll_ifindex
>> -are used.
>>  .SS Socket Options
>>  Packet sockets can be used to configure physical layer multicasting
>>  and promiscuous mode.
>>
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/



--=20
Best,

Jian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
