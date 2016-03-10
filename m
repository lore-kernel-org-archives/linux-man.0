From: Krzysztof Adamski <k@japko.eu>
Subject: Re: [PATCH] execve.2: EPERM from filesystem capabilities.
Date: Thu, 10 Mar 2016 16:06:33 +0100
Message-ID: <20160310150633.GG25658@box2.japko.eu>
References: <20151012194506.GA6346@box2.japko.eu>
 <56DF7325.9030702@gmail.com>
 <20160309201501.GE25658@box2.japko.eu>
 <56E0C0C3.6040808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E0C0C3.6040808-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Mar 10, 2016 at 01:33:07AM +0100, Michael Kerrisk (man-pages) w=
rote:
>Hello Krzysztof
>
>On 03/09/2016 09:15 PM, Krzysztof Adamski wrote:
>> On Wed, Mar 09, 2016 at 01:49:41AM +0100, Michael Kerrisk (man-pages=
) wrote:
>>> Hello Krzysztof
>>>
>>> Sorry for the delayed follow up.
>>>
>>> On 10/12/2015 09:45 PM, Krzysztof Adamski wrote:
>>>> An EPERM error can be returned when using filesystem capabilities =
and
>>>> capabilities to be added are not in permitted set.
>>>>
>>>> This error return values was introduced by this patch:
>>>> 5459c16 security: protect legacy applications from executing with
>>>> insufficient privilege
>>>
>>> Can you explain in more detail the scenario where EPERM can be prod=
uced.
>>> I can't see/produce it. Also, the code in the commit that you menti=
on,
>>> which was part of Linux 2.6.27, was thoroughly changed in Linux 2.6=
=2E29.
>>
>> Hi Michael,
>> If you're interested in details, I explained it quite extensively he=
re:
>> http://k.japko.eu/systemd-nspawn-ping-debug.html
>>
>> The summary is that I used nspawn from systemd which drops some
>> capabilites (CAP_NET_ADMIN is amoung them) when spawning a container=
=2E
>> Now, since I used Fedora in container, my ping binary had filesystem
>> capabilites set:
>>
>> # getcap /bin/ping
>> /bin/ping =3D cap_net_admin,cap_net_raw+ep
>>
>> So when executing this application, kernel tried to give me
>> CAP_NET_ADMIN capabilities but they where not on permitted set so I'=
ve
>> got EPERM.
>>
>> It was found in kernel 4.1 back then and I just retested this on ker=
nel
>> 4.3. Unfortunately I don't have time now to verify this for the late=
st
>> kernel but I would be surprised if this feature was removed.
>>
>> Would you like me to extend/change the description in the patch some=
how?
>
>Okay -- I got it at last. I think the explanation requires quite
>some detail. I added this to execve(2):
>
>       EPERM  A  "capability-dumb"  applications  would not obtain the
>              full set of permitted capabilities granted by  the  exe=E2=
=80=90
>              cutable file.  See capabilities(7).
>
>And this to capabilities(7):
>
>   Safety checking for capability-dumb binaries
>       A  capability-dumb binary is a legacy application that has been
>       marked to have file capabilities, but has not been converted to
>       use  the  libcap(3)  API  to  manipulate its capabilities.  (In
>       other words, this is  a  traditional  set-user-ID-root  program
>       that has been switched to use file capabilities, but whose code
>       has not been modified to understand  capabilities.)   For  such
>       applications,  the effective capability bit is set on the file,
>       so that  the  file  permitted  capabilities  are  automatically
>       enabled  in  the process effective set when executing the file.
>       The kernel recognizes a file which has the effective capability
>       bit  set  as  capability-dumb  for  the  purpose  of  the check
>       described here.
>
>       When executing a capability-dumb binary, the kernel  checks  if
>       the process obtained all permitted capabilities that were spec=E2=
=80=90
>       ified in the file permitted set, after the capability transfor=E2=
=80=90
>       mations described above have been performed.  (The typical rea=E2=
=80=90
>       son why this might not occur is that  the  capability  bounding
>       set  masked  out some of the capabilities in the file permitted
>       set.)  If the process did not obtain the full set of file  per=E2=
=80=90
>       mitted capabilities, then execve(2) fails with the error EPERM.
>       This prevents possible security risks that could arise  when  a
>       capability-dumb  application  is  executed  with less privilege
>       that it needs.  Note that, by definition, the application could
>       not itself recognize this problem, since it does not employ the
>       libcap(3) API.
>
>Let me know if you see anything amiss.

This looks good to me. It is however a little confusing (in Linux) to=20
say that this is legacy mode since you could use libcap API long before=
=20
filesystem capabilities were actually implemented in the kernel :)

Best regards,
Krzysztof Adamski
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
