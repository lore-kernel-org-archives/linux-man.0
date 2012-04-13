From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Sat, 14 Apr 2012 11:40:19 +1200
Message-ID: <CAKgNAkgo2NLjgjozx2W7tuieMG_4fz7waeeH6r35s4WHnMhCWQ@mail.gmail.com>
References: <51634.1318537560@proseconsulting.co.uk> <CAKgNAkjAsWSiZEhFqnhFQDiFzLxcPzHQ1OweZswtB4q-fRf-ig@mail.gmail.com>
 <4F74CFDC.10802@proseconsulting.co.uk> <CAKgNAkjddHc9_snmdiEucEnVFEwVVz2JxijdNncATTKROgzbqQ@mail.gmail.com>
 <042c392d-fe53-49e9-99e5-84737f1ca2f4@email.android.com> <CAKgNAkjMW84RhN7tnDzb-hr8dWbK7ZWEge-roWHHJUay_D2uBA@mail.gmail.com>
 <4F8890F5.8070502@proseconsulting.co.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8890F5.8070502-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Sat, Apr 14, 2012 at 8:47 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> On 30/03/2012 10:50, Michael Kerrisk (man-pages) wrote:
>>
>> Hi Mark,
>>
>> On Fri, Mar 30, 2012 at 10:28 PM, Mark R Bannister
>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> =A0wrote:
>>>>>>
>>>>>> Thanks Mark. This looks good. I've done some light edits. Could =
you
>>>>>> please review the below (also attached).
>>>>>
>>>>>
>>>>> Hi Michael,
>>>>>
>>>>> I've reviewed your edits. They're almost all good, but I've had t=
o
>>>>> counter
>>>>> some of your light edits. Latest version below and attached.
>>>>
>>>> Hi Mark,
>>>> Can you explain your changes? It looks like they mostly revert my
>>>> additions of commas and formatting consistency with other pages.
>>>> Why?
>>>> Thanks, Michael
>>>
>>> Hi Michael,
>>>
>>> It's hard to know what exactly we're talking about here because you=
r
>>> light edits were not supplied in a way that could easily be reviewe=
d.
>>> In fact, I had to diff the two to find out what you had edited.
>>
>> I understand what you mean. The problem is that while =A0the edits w=
ere
>> light, they touched a lot of lines (adding commas, changing formatti=
ng
>> to be consistent with other man pages, modifying a few wordings,
>> reordering some text, rewrapping some source lines), and so the diff
>> was nearly as long as the page itself. So, it seemed simplest just t=
o
>> give you the revised page, and allow you to read it fresh.
>>
>>> I suggest the best approach is for you to apply my original patch
>>> unedited, then submit to this list a new patch with your suggested
>>> edits. =A0Then it will be easier for us to discuss which edits I di=
dn't
>>> believe were correct or necessary, and others would also
>>> have transparency and be able to comment if they wished too.
>>
>> Okay.
>>
>> Regarding addition of commas, changes of formatting, and so on, keep
>> this in mind: my "big picture" is to try to have some consistency
>> across man pages. You might have different ideas on some points, but
>> I'm very interested in consistency across pages (and I do have quite=
 a
>> lot of experience of coy-editing and being copy-edited).
>
>
> Hi Michael,
>
> Sorry for the delay in replying. =A0Thanks for sending the patch, my =
comments
> are in-line below.

[...]

>> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
>> index 6a2a82e..83cc5f8 100644
>> --- a/man5/nsswitch.conf.5
>> +++ b/man5/nsswitch.conf.5
>> @@ -18,31 +18,30 @@
>> =A0.\"
>> =A0.\" You should have received a copy of the GNU General Public
>> =A0.\" License along with this manual; if not, write to the Free
>> -.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, =
MA
>> 02111,
>> -.\" USA.
>> +.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
>> +.\" MA 02111, USA.
>
>
> np
>
>
>> =A0.\"
>> -.TH NSSWITCH.CONF 5 2011-10-13 "Linux" "Linux Programmer's Manual"
>> +.TH NSSWITCH.CONF 5 2012-03-29 "Linux" "Linux Programmer's Manual"
>
>
> np
>
>
>> =A0.SH NAME
>> =A0nsswitch.conf \- Name Service Switch configuration file
>> =A0.SH DESCRIPTION
>> =A0The
>> =A0.I /etc/nsswitch.conf
>> -file is a configuration file used by the GNU C Library to determine=
 from
>> -what sources to obtain name service information in a range of categ=
ories,
>> +("Name Server Switch", NSS)
>
>
> Unnecessary, not good grammar and incorrect to insert this text in
> parentheses. =A0Unnecessary because we mention it in the NOTES sectio=
n below,
> not good grammar on several counts not least of which because it inte=
rrupts
> the fluency of the sentence, and incorrect because NSS stands for "Na=
me
> Service Switch" not "Name Server Switch", nor "Names Server Switch" a=
s you

D'oh. Those were thinkos on my part!

> have it later on. =A0As I also mention later on, I'm not a big fan of=
 using
> parentheses in the middle of sentences, especially when a perfectly g=
ood
> sentence can be constructed without. =A0This isn't a shell script.

My addition of the parenthetical text here was to address the problem
that later in the page, the undefined abbreviation "NSS" is used. I'll
rewrite the start of that sentence as:

=3D=3D
The Name Service Switch (NSS) configuration file,
=2EIR /etc/nsswitch.conf ,
is used by the GNU C Library to determine
=3D=3D

>> +file is a configuration file used by the GNU C Library to determine
>> +the sources from which to obtain name-service information in
>
> np except that "name service" does not need hyphenation. =A0We don't =
hyphenate
> it anywhere else in the page, so don't need to here.

See http://en.wikipedia.org/wiki/Compound_modifier#Hyphenation_of_eleme=
nts

>
>> +a range of categories,
>> =A0and in what order.
>> =A0Each category of information is identified by a database name.
>> =A0.LP
>> =A0The file is plain ASCII text, with columns separated by spaces or=
 tab
>> =A0characters.
>> -The first column defines the database name.
>> +The first column specifies the database name.
>
>
> np
>
>
>> =A0The remaining columns describe the order of sources to query and =
a
>> -limited
>> -set of actions that can be performed by lookup result.
>
>
> np
>
>
>> +limited set of actions that can be performed by lookup result.
>> =A0.LP
>> -The following databases are made available by the standard
>> -GNU C Library:
>> -.RS 3
>> -.TP 10
>> +The following databases are understood by the GNU C Library:
>> +.TP 12
>
>
> The way you format tables and lists, left flush with no indentation, =
is not
> easy to read. =A0I prefer all my lists to be indented, which makes th=
e page
> easier to read. =A0If any list is going to be indented, they all shou=
ld be,
> and to the same level. =A0So this comment applies to all your RS, TP =
and RE
> changes below as well.

Of course there's room for debate here, but the rationale is this:
1. Consistent formatting across pages
2. We only have 80 columns (less on some displays), so do not be too
profligate with left indents.

>> =A0.B aliases
>> =A0Mail aliases, used by
>> =A0.BR getaliasent (3)
>> @@ -62,8 +61,8 @@ Host names and numbers, used by
>> =A0and related functions.
>> =A0.TP
>> =A0.B netgroup
>> -Network wide list of hosts and users, used for access rules.
>> -C libraries before glibc 2.1 only supported netgroups over NIS.
>> +Network-wide list of hosts and users, used for access rules.
>> +C libraries before glibc 2.1 supported netgroups only over NIS.
>
>
> np
>
>
>> =A0.TP
>> =A0.B networks
>> =A0Network names and numbers, used by
>> @@ -97,13 +96,12 @@ and related functions.
>> =A0Shadow user passwords, used by
>> =A0.BR getspnam (3)
>> =A0and related functions.
>> -.RE
>> =A0.LP
>> =A0Here is an example
>> =A0.I /etc/nsswitch.conf
>> =A0file:
>> =A0.LP
>> -.RS 3
>> +.RS 4
>> =A0.PD 0
>> =A0.TP 16
>> =A0passwd:
>> @@ -138,16 +136,13 @@ nis [NOTFOUND=3Dreturn] files
>> =A0.LP
>> =A0The first column is the database name.
>> =A0The remaining columns specify:
>> -.RS 3
>> -.TP 3
>> -o
>> -One or more service specifications e.g. "files", "db", or "nis".
>> -The order the services appear on the line determine the order in wh=
ich
>> +.IP * 3
>> +One or more service specifications e.g., "files", "db", or "nis".
>> +The order of the services on the line determines the order in which
>
>
> np
>
>
>> =A0those services will be queried, in turn, until a result is found.
>> -.TP
>> -o
>> +.IP *
>> =A0Optional actions to perform if a particular result is obtained
>> -from the preceding service, e.g. "[NOTFOUND=3Dreturn]".
>> +from the preceding service, e.g., "[NOTFOUND=3Dreturn]".
>
>
> A comma after a dot is redundant. =A0This applies to all cases where =
you have
> changed "e.g." to "e.g.,". =A0Mind you, a little research revealed:
> http://dictionary.reference.com/help/faq/language/g58.html which I ha=
d not
> previously been aware of.
>
> I write British English.

Yes, there's regional variation here. Oxford Style Manual omits the
comma. Chicago MOS uses it. Man-pages generally follows American usage
(spelling, etc.).

>> =A0.RE
>> =A0.LP
>> =A0The service specifications supported on your system depend on the
>> @@ -158,8 +153,15 @@ will provide the named
>> =A0.IR SERVICE .
>> =A0On a standard installation, you can use
>> =A0"files", "db", "nis", and "nisplus".
>> -For the hosts database, you can additionally specify "dns".
>> -For the passwd, group, and shadow databases, you can additionally s=
pecify
>> +For the
>> +.B hosts
>> +database, you can additionally specify "dns".
>> +For the
>> +.BR passwd ,
>> +.BR group ,
>> +and
>> +.BR shadow
>> +databases, you can additionally specify
>
>
> np
>
>
>> =A0"compat" (see
>> =A0.B "Compatibility mode"
>> =A0below).
>> @@ -169,28 +171,20 @@ may be 1 for glibc 2.0, or 2 for glibc 2.1 and
>> later.
>> =A0On systems with additional libraries installed, you may have acce=
ss to
>> =A0further services such as "hesiod", "ldap", "winbind" and "wins".
>> =A0.LP
>> -An action may also be specified following a service specification, =
that
>> -modifies behaviour following a result obtained from the preceding d=
ata
>> -source.
>> +An action may also be specified following a service specification.
>> +The action modifies the behaviour following a result obtained

Just spotted this. Should be "behavior".

>> +from the preceding data source.
>
>
> np
>
>
>> =A0Action items take the general form:
>
>
>> =A0.LP
>> -.RS 3
>> -[
>> -.I STATUS
>> -=3D
>> -.I ACTION
>> -]
>> +.RS 4
>> +.RI [ STATUS =3D ACTION ]
>
>
> np
>
>
>> =A0.br
>> -[ !
>> -.I STATUS
>> -=3D
>> -.I ACTION
>> -]
>> +.RI [! STATUS =3D ACTION ]
>
>
> np
>
>
>> =A0.RE
>> =A0.LP
>> =A0where
>> =A0.LP
>> -.RS 3
>> +.RS 4
>> =A0.I STATUS
>> =A0=3D>
>> =A0.B success
>> @@ -210,14 +204,14 @@ where
>> =A0.LP
>> =A0The ! negates the test, matching all possible results except the
>> =A0one specified.
>> -The case of the keywords is insignificant.
>> +The case of the keywords is not significant.
>
>
> np
>
>
>> =A0.LP
>> =A0The
>> =A0.I STATUS
>> =A0value is matched against the result of the lookup function called=
 by
>> =A0the preceding service specification, and can be one of:
>> -.RS 3
>> -.TP 10
>> +.RS 4
>> +.TP 12
>> =A0.B success
>> =A0No error occurred and the requested entry is returned.
>> =A0The default action for this condition is "return".
>> @@ -228,8 +222,8 @@ The default action for this condition is "contin=
ue".
>> =A0.TP
>> =A0.B unavail
>> =A0The service is permanently unavailable.
>> -This can either mean the
>> -required file cannot be read, or, for network services, the server
>> +This can mean either that the
>> +required file cannot be read, or, for network services, that the se=
rver
>
>
> np
>
>
>> =A0is not available or does not allow queries.
>> =A0The default action for this condition is "continue".
>> =A0.TP
>> @@ -243,8 +237,8 @@ The default action for this condition is "contin=
ue".
>> =A0The
>> =A0.I ACTION
>> =A0value can be one of:
>> -.RS 3
>> -.TP 10
>> +.RS 4
>> +.TP 12
>> =A0.B return
>> =A0Return a result now.
>> =A0Do not call any further lookup functions.
>> @@ -258,7 +252,7 @@ additionally permits special entries in
>> =A0.I /etc/passwd
>> =A0for granting users or members of netgroups access to the system.
>> =A0The following entries are valid in this mode:
>> -.RS 3
>> +.RS 4
>> =A0.TP 12
>> =A0.BI + user
>> =A0Include the specified
>> @@ -279,14 +273,14 @@ Exclude all users in the given
>> =A0.IR netgroup .
>> =A0.TP
>> =A0.B +
>> -Include every user, except previously excluded ones, in the
>> +Include every user, except previously excluded ones, from the
>
>
> np
>
>
>> =A0NIS passwd map.
>> =A0.RE
>> =A0.LP
>> =A0By default the source is "nis", but this may be
>> -overridden by specifying "nisplus" as source for the pseudo-databas=
es
>> +overridden by specifying "nisplus" as the source for the pseudo-dat=
abases
>
>
> np
>
>
>> =A0.BR passwd_compat ,
>> -.B group_compat
>> +.BR group_compat ,
>
>
> A comma before "and" is generally not good grammar unless the sentenc=
e is
> complex and the extra pauses help the reader. =A0In this case the sen=
tence is
> short and the comma you've inserted adds no extra clarity.

Me and man-pages favor the Oxford comma. It's a stylistic choice.
See http://en.wikipedia.org/wiki/Serial_comma

>> =A0and
>> =A0.BR shadow_compat .
>> =A0.SH FILES
>> @@ -296,7 +290,7 @@ is implemented by a shared object library named
>> =A0.IB libnss_SERVICE.so. X
>> =A0that resides in
>> =A0.IR /lib .
>> -.RS 3
>> +.RS 4
>> =A0.TP 25
>> =A0.PD 0
>> =A0.I /etc/nsswitch.conf
>> @@ -324,9 +318,6 @@ implements "nis" source.
>> =A0implements "nisplus" source.
>> =A0.PD
>> =A0.RE
>> -.SH SEE ALSO
>> -.BR getent (1),
>> -.BR nss (5).
>> =A0.SH NOTES
>> =A0Within each process that uses
>> =A0.BR nsswitch.conf ,
>> @@ -334,16 +325,17 @@ the entire file is read only once.
>> =A0If the file is later changed, the
>> =A0process will continue using the old configuration.
>> =A0.LP
>> -Traditionally there was only a single source for service informatio=
n,
>> +Traditionally, there was only a single source for service informati=
on,
>
>
> Redundant comma.

I would have said "optional" (because the part before the comma is
small), and a stylistic choice.

>> =A0often in the form of a single configuration
>> -file (e.g. \fI/etc/passwd\fP).
>> -However, as other nameservices, like the Network Information
>> +file (e.g., \fI/etc/passwd\fP).
>
>
> E.g. discussion above.
>
>
>> +However, as other name services, such as the Network Information
>
>
> np
>
>
>> =A0Service (NIS) and the Domain Name Service (DNS), became popular,
>> =A0a method was needed
>> =A0that would be more flexible than fixed search orders coded into
>> =A0the C library.
>> -.LP
>> -The Linux libc5 with NYS support and the GNU C Library 2.x (libc.so=
=2E6)
>> -introduced a cleaner solution to the problem, based on the
>> -.B "Name Service Switch"
>> -mechanism used by Sun Microsystems in the Solaris 2 C library.
>> +The Names Server Switch mechanism
>
>
> "Name Service Switch" is correct. =A0"Names Server Switch" is incorre=
ct.

Yes, fixed now. Thanks.

>> +(based on the mechanism used by Sun Microsystems in the Solaris 2 C
>> library)
>
>
> I don't like the use of parentheses. =A0If one can write a good sente=
nce
> without using them, more the better. =A0So editing a sentence that di=
dn't need
> to use parentheses, and adding them in, is not going to get my vote.

Yes, stylistically you are probably right. Overuse of parenthesis is
one of my writing bad habits that I have trouble to stamp out. I'll
make it:

=3D=3D
The Name Service Switch mechanism,
which was based on the mechanism used by
Sun Microsystems in the Solaris 2 C library,
introduced a cleaner solution to the problem.
=3D=3D

>> +introduced a cleaner solution to the problem.
>> +.SH SEE ALSO
>> +.BR getent (1),
>> +.BR nss (5)
>>
>>
>
> np moving SEE ALSO to end.
>
> I hope you understand now which edits I had no problem with. =A0A lar=
ge number
> of your edits were not controversial and I agree with. =A0You can now=
 see the
> handful of edits that I disagreed with.

Okay, thanks Mark.

I've merged this patch now, and pushed to kernel.org git.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
