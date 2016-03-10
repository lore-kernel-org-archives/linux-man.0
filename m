From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Thu, 10 Mar 2016 18:07:18 +0100
Message-ID: <56E1A9C6.1070307@gmail.com>
References: <20151012194506.GA6346@box2.japko.eu> <56DF7325.9030702@gmail.com>
 <20160309201501.GE25658@box2.japko.eu> <56E0C0C3.6040808@gmail.com>
 <20160310150633.GG25658@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160310150633.GG25658-xLeyfSbClftGit24Ens98Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <k@japko.eu>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/10/2016 04:06 PM, Krzysztof Adamski wrote:
> On Thu, Mar 10, 2016 at 01:33:07AM +0100, Michael Kerrisk (man-pages)=
 wrote:
>> Hello Krzysztof
>>
>> On 03/09/2016 09:15 PM, Krzysztof Adamski wrote:
>>> On Wed, Mar 09, 2016 at 01:49:41AM +0100, Michael Kerrisk (man-page=
s) wrote:
>>>> Hello Krzysztof
>>>>
>>>> Sorry for the delayed follow up.
>>>>
>>>> On 10/12/2015 09:45 PM, Krzysztof Adamski wrote:
>>>>> An EPERM error can be returned when using filesystem capabilities=
 and
>>>>> capabilities to be added are not in permitted set.
>>>>>
>>>>> This error return values was introduced by this patch:
>>>>> 5459c16 security: protect legacy applications from executing with
>>>>> insufficient privilege
>>>>
>>>> Can you explain in more detail the scenario where EPERM can be pro=
duced.
>>>> I can't see/produce it. Also, the code in the commit that you ment=
ion,
>>>> which was part of Linux 2.6.27, was thoroughly changed in Linux 2.=
6.29.
>>>
>>> Hi Michael,
>>> If you're interested in details, I explained it quite extensively h=
ere:
>>> http://k.japko.eu/systemd-nspawn-ping-debug.html
>>>
>>> The summary is that I used nspawn from systemd which drops some
>>> capabilites (CAP_NET_ADMIN is amoung them) when spawning a containe=
r.
>>> Now, since I used Fedora in container, my ping binary had filesyste=
m
>>> capabilites set:
>>>
>>> # getcap /bin/ping
>>> /bin/ping =3D cap_net_admin,cap_net_raw+ep
>>>
>>> So when executing this application, kernel tried to give me
>>> CAP_NET_ADMIN capabilities but they where not on permitted set so I=
've
>>> got EPERM.
>>>
>>> It was found in kernel 4.1 back then and I just retested this on ke=
rnel
>>> 4.3. Unfortunately I don't have time now to verify this for the lat=
est
>>> kernel but I would be surprised if this feature was removed.
>>>
>>> Would you like me to extend/change the description in the patch som=
ehow?
>>
>> Okay -- I got it at last. I think the explanation requires quite
>> some detail. I added this to execve(2):
>>
>>       EPERM  A  "capability-dumb"  applications  would not obtain th=
e
>>              full set of permitted capabilities granted by  the  exe=
=E2=80=90
>>              cutable file.  See capabilities(7).
>>
>> And this to capabilities(7):
>>
>>   Safety checking for capability-dumb binaries
>>       A  capability-dumb binary is a legacy application that has bee=
n
>>       marked to have file capabilities, but has not been converted t=
o
>>       use  the  libcap(3)  API  to  manipulate its capabilities.  (I=
n
>>       other words, this is  a  traditional  set-user-ID-root  progra=
m
>>       that has been switched to use file capabilities, but whose cod=
e
>>       has not been modified to understand  capabilities.)   For  suc=
h
>>       applications,  the effective capability bit is set on the file=
,
>>       so that  the  file  permitted  capabilities  are  automaticall=
y
>>       enabled  in  the process effective set when executing the file=
=2E
>>       The kernel recognizes a file which has the effective capabilit=
y
>>       bit  set  as  capability-dumb  for  the  purpose  of  the chec=
k
>>       described here.
>>
>>       When executing a capability-dumb binary, the kernel  checks  i=
f
>>       the process obtained all permitted capabilities that were spec=
=E2=80=90
>>       ified in the file permitted set, after the capability transfor=
=E2=80=90
>>       mations described above have been performed.  (The typical rea=
=E2=80=90
>>       son why this might not occur is that  the  capability  boundin=
g
>>       set  masked  out some of the capabilities in the file permitte=
d
>>       set.)  If the process did not obtain the full set of file  per=
=E2=80=90
>>       mitted capabilities, then execve(2) fails with the error EPERM=
=2E
>>       This prevents possible security risks that could arise  when  =
a
>>       capability-dumb  application  is  executed  with less privileg=
e
>>       that it needs.  Note that, by definition, the application coul=
d
>>       not itself recognize this problem, since it does not employ th=
e
>>       libcap(3) API.
>>
>> Let me know if you see anything amiss.
>=20
> This looks good to me. It is however a little confusing (in Linux) to=
=20
> say that this is legacy mode since you could use libcap API long befo=
re=20
> filesystem capabilities were actually implemented in the kernel :)

=46air enough. The word "legacy" doesn't really convey anything helpful
here, so I've removed it.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
