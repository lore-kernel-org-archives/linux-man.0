From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: veth(4) draft manual page
Date: Thu, 19 Oct 2017 19:12:22 +0200
Message-ID: <CAKgNAkj3sZMpr23FxTj9Nq-d5sFCLvVSZdixPAz6-HWv8tqcQA@mail.gmail.com>
References: <CAKgNAkgWyh_dv=2a2c2poCbwcBmBx+z69Sr7mYiX6EbkwQA7+A@mail.gmail.com>
 <alpine.DEB.2.11.1710191201510.30436@hier>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.11.1710191201510.30436@hier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Tom=C3=A1=C5=A1,

On 19 October 2017 at 12:17, Tomas Pospisek <tpo-UQchlGytWBLoPl2ZpcX+cw@public.gmane.org> wrote:
> Hello all,
>
> On Wed, 18 Oct 2017, Michael Kerrisk (man-pages) wrote:
>
>> Hello all,
>>
>> Long ago (http://www.spinics.net/lists/linux-man/msg03193.html), Tom=C3=
=A1=C5=A1
>> started work on a veth.4 page, and Eric through in some comments as
>> well, but the effort to complete the page petered out. I decided to
>> take a shot at picking up what was said so far completing it.
>
> Very nice, thanks!
>
>> Are there any comments on the page below?
>
> Based on the principle that I prefer useful to mathematically orthogonal =
man
> pages, I'd suggest to document how you actually do create a veth in a
> different network namespace:

Agreed.

>> Cheers,
>>
>> Michael
>>
>> veth(4)                 Linux Programmer's Manual                 veth(4=
)
>>
>> NAME
>>       veth - Virtual Ethernet Device
>>
>> DESCRIPTION
>>       The  veth  devices  are virtual Ethernet devices.  They can act as
>>       tunnels between network namespaces to create a bridge to a  physi=
=E2=80=90
>>       cal  network  device in another namespace, but can also be used as
>>       standalone network devices.
>>
>>       veth devices are always created in interconnected pairs.   A  pair
>>       can be created using the command:
>>
>>           # ip link add <p1-name> type veth peer name <p2-name>
>>
>>       In  the  above,  p1-name and p2-name are the names assigned to the
>>       two connected end points.
>>
>>       Packets transmitted on one device  in  the  pair  are  immediately
>>       received  on  the  other  device.  When either devices is down the
>>       link state of the pair is down.
>>
>>       veth device pairs are useful for combining the network  facilities
>>       of the kernel together in interesting ways.  A particularly inter=
=E2=80=90
>>       esting use case is to place one end of a veth pair in one  network
>>       namespace  and  the  other  end in another network namespace, thus
>>       allowing communication between network namespaces:
>
>
>         First you create the veth as above and then you move one side of
>         the pair to the other namespace:
>
>             # ip link set <p2-name> netns <p2-namespace>

Thanks. I added that.

>>       ethtool(8) can be used to find the peer of a veth  network  inter=
=E2=80=90
>>       face, using commands something like:
>>
>>           # ip link add ve_A type veth peer name ve_B   # Create veth pa=
ir
>>           # ethtool -S ve_A         # Discover interface index of peer
>>           NIC statistics:
>>                peer_ifindex: 16
>>           # ip link | grep '^16:'   # Look up interface
>>           16: ve_B@ve_A: <BROADCAST,MULTICAST,M-DOWN> mtu 1500 qdisc ...
>>
>> SEE ALSO
>>       clone(2), ip(8), ip-link(8), ip-netns(8)
>
>
> Thanks a lot Michael & best greetings!

Cheers,

Michael

PS Maybe catch up with you someday again in Bern? I'm there now and then.





--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
