From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Fri, 30 Mar 2012 22:50:30 +1300
Message-ID: <CAKgNAkjMW84RhN7tnDzb-hr8dWbK7ZWEge-roWHHJUay_D2uBA@mail.gmail.com>
References: <51634.1318537560@proseconsulting.co.uk> <CAKgNAkjAsWSiZEhFqnhFQDiFzLxcPzHQ1OweZswtB4q-fRf-ig@mail.gmail.com>
 <4F74CFDC.10802@proseconsulting.co.uk> <CAKgNAkjddHc9_snmdiEucEnVFEwVVz2JxijdNncATTKROgzbqQ@mail.gmail.com>
 <042c392d-fe53-49e9-99e5-84737f1ca2f4@email.android.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <042c392d-fe53-49e9-99e5-84737f1ca2f4-2ueSQiBKiTY7tOexoI0I+QC/G2K4zDHf@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark,

On Fri, Mar 30, 2012 at 10:28 PM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
>>>> Thanks Mark. This looks good. I've done some light edits. Could yo=
u
>>>> please review the below (also attached).
>>>
>>>
>>> Hi Michael,
>>>
>>> I've reviewed your edits. They're almost all good, but I've had to =
counter
>>> some of your light edits. Latest version below and attached.
>>
>> Hi Mark,
>> Can you explain your changes? It looks like they mostly revert my ad=
ditions of commas and formatting consistency with other pages.
>> Why?
>> Thanks, Michael
>
> Hi Michael,
>
> It's hard to know what exactly we're talking about here because your
> light edits were not supplied in a way that could easily be reviewed.
> In fact, I had to diff the two to find out what you had edited.

I understand what you mean. The problem is that while  the edits were
light, they touched a lot of lines (adding commas, changing formatting
to be consistent with other man pages, modifying a few wordings,
reordering some text, rewrapping some source lines), and so the diff
was nearly as long as the page itself. So, it seemed simplest just to
give you the revised page, and allow you to read it fresh.

> I suggest the best approach is for you to apply my original patch
> unedited, then submit to this list a new patch with your suggested
> edits. =A0Then it will be easier for us to discuss which edits I didn=
't
> believe were correct or necessary, and others would also
> have transparency and be able to comment if they wished too.

Okay.

Regarding addition of commas, changes of formatting, and so on, keep
this in mind: my "big picture" is to try to have some consistency
across man pages. You might have different ideas on some points, but
I'm very interested in consistency across pages (and I do have quite a
lot of experience of coy-editing and being copy-edited).

Patch below.

Cheers,

Michael

diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
index 6a2a82e..83cc5f8 100644
--- a/man5/nsswitch.conf.5
+++ b/man5/nsswitch.conf.5
@@ -18,31 +18,30 @@
 .\"
 .\" You should have received a copy of the GNU General Public
 .\" License along with this manual; if not, write to the Free
-.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA =
02111,
-.\" USA.
+.\" Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+.\" MA 02111, USA.
 .\"
-.TH NSSWITCH.CONF 5 2011-10-13 "Linux" "Linux Programmer's Manual"
+.TH NSSWITCH.CONF 5 2012-03-29 "Linux" "Linux Programmer's Manual"
 .SH NAME
 nsswitch.conf \- Name Service Switch configuration file
 .SH DESCRIPTION
 The
 .I /etc/nsswitch.conf
-file is a configuration file used by the GNU C Library to determine fr=
om
-what sources to obtain name service information in a range of categori=
es,
+("Name Server Switch", NSS)
+file is a configuration file used by the GNU C Library to determine
+the sources from which to obtain name-service information in
+a range of categories,
 and in what order.
 Each category of information is identified by a database name.
 .LP
 The file is plain ASCII text, with columns separated by spaces or tab
 characters.
-The first column defines the database name.
+The first column specifies the database name.
 The remaining columns describe the order of sources to query and a
-limited
-set of actions that can be performed by lookup result.
+limited set of actions that can be performed by lookup result.
 .LP
-The following databases are made available by the standard
-GNU C Library:
-.RS 3
-.TP 10
+The following databases are understood by the GNU C Library:
+.TP 12
 .B aliases
 Mail aliases, used by
 .BR getaliasent (3)
@@ -62,8 +61,8 @@ Host names and numbers, used by
 and related functions.
 .TP
 .B netgroup
-Network wide list of hosts and users, used for access rules.
-C libraries before glibc 2.1 only supported netgroups over NIS.
+Network-wide list of hosts and users, used for access rules.
+C libraries before glibc 2.1 supported netgroups only over NIS.
 .TP
 .B networks
 Network names and numbers, used by
@@ -97,13 +96,12 @@ and related functions.
 Shadow user passwords, used by
 .BR getspnam (3)
 and related functions.
-.RE
 .LP
 Here is an example
 .I /etc/nsswitch.conf
 file:
 .LP
-.RS 3
+.RS 4
 .PD 0
 .TP 16
 passwd:
@@ -138,16 +136,13 @@ nis [NOTFOUND=3Dreturn] files
 .LP
 The first column is the database name.
 The remaining columns specify:
-.RS 3
-.TP 3
-o
-One or more service specifications e.g. "files", "db", or "nis".
-The order the services appear on the line determine the order in which
+.IP * 3
+One or more service specifications e.g., "files", "db", or "nis".
+The order of the services on the line determines the order in which
 those services will be queried, in turn, until a result is found.
-.TP
-o
+.IP *
 Optional actions to perform if a particular result is obtained
-from the preceding service, e.g. "[NOTFOUND=3Dreturn]".
+from the preceding service, e.g., "[NOTFOUND=3Dreturn]".
 .RE
 .LP
 The service specifications supported on your system depend on the
@@ -158,8 +153,15 @@ will provide the named
 .IR SERVICE .
 On a standard installation, you can use
 "files", "db", "nis", and "nisplus".
-For the hosts database, you can additionally specify "dns".
-For the passwd, group, and shadow databases, you can additionally spec=
ify
+For the
+.B hosts
+database, you can additionally specify "dns".
+For the
+.BR passwd ,
+.BR group ,
+and
+.BR shadow
+databases, you can additionally specify
 "compat" (see
 .B "Compatibility mode"
 below).
@@ -169,28 +171,20 @@ may be 1 for glibc 2.0, or 2 for glibc 2.1 and la=
ter.
 On systems with additional libraries installed, you may have access to
 further services such as "hesiod", "ldap", "winbind" and "wins".
 .LP
-An action may also be specified following a service specification, tha=
t
-modifies behaviour following a result obtained from the preceding data
-source.
+An action may also be specified following a service specification.
+The action modifies the behaviour following a result obtained
+from the preceding data source.
 Action items take the general form:
 .LP
-.RS 3
-[
-.I STATUS
-=3D
-.I ACTION
-]
+.RS 4
+.RI [ STATUS =3D ACTION ]
 .br
-[ !
-.I STATUS
-=3D
-.I ACTION
-]
+.RI [! STATUS =3D ACTION ]
 .RE
 .LP
 where
 .LP
-.RS 3
+.RS 4
 .I STATUS
 =3D>
 .B success
@@ -210,14 +204,14 @@ where
 .LP
 The ! negates the test, matching all possible results except the
 one specified.
-The case of the keywords is insignificant.
+The case of the keywords is not significant.
 .LP
 The
 .I STATUS
 value is matched against the result of the lookup function called by
 the preceding service specification, and can be one of:
-.RS 3
-.TP 10
+.RS 4
+.TP 12
 .B success
 No error occurred and the requested entry is returned.
 The default action for this condition is "return".
@@ -228,8 +222,8 @@ The default action for this condition is "continue"=
=2E
 .TP
 .B unavail
 The service is permanently unavailable.
-This can either mean the
-required file cannot be read, or, for network services, the server
+This can mean either that the
+required file cannot be read, or, for network services, that the serve=
r
 is not available or does not allow queries.
 The default action for this condition is "continue".
 .TP
@@ -243,8 +237,8 @@ The default action for this condition is "continue"=
=2E
 The
 .I ACTION
 value can be one of:
-.RS 3
-.TP 10
+.RS 4
+.TP 12
 .B return
 Return a result now.
 Do not call any further lookup functions.
@@ -258,7 +252,7 @@ additionally permits special entries in
 .I /etc/passwd
 for granting users or members of netgroups access to the system.
 The following entries are valid in this mode:
-.RS 3
+.RS 4
 .TP 12
 .BI + user
 Include the specified
@@ -279,14 +273,14 @@ Exclude all users in the given
 .IR netgroup .
 .TP
 .B +
-Include every user, except previously excluded ones, in the
+Include every user, except previously excluded ones, from the
 NIS passwd map.
 .RE
 .LP
 By default the source is "nis", but this may be
-overridden by specifying "nisplus" as source for the pseudo-databases
+overridden by specifying "nisplus" as the source for the pseudo-databa=
ses
 .BR passwd_compat ,
-.B group_compat
+.BR group_compat ,
 and
 .BR shadow_compat .
 .SH FILES
@@ -296,7 +290,7 @@ is implemented by a shared object library named
 .IB libnss_SERVICE.so. X
 that resides in
 .IR /lib .
-.RS 3
+.RS 4
 .TP 25
 .PD 0
 .I /etc/nsswitch.conf
@@ -324,9 +318,6 @@ implements "nis" source.
 implements "nisplus" source.
 .PD
 .RE
-.SH SEE ALSO
-.BR getent (1),
-.BR nss (5).
 .SH NOTES
 Within each process that uses
 .BR nsswitch.conf ,
@@ -334,16 +325,17 @@ the entire file is read only once.
 If the file is later changed, the
 process will continue using the old configuration.
 .LP
-Traditionally there was only a single source for service information,
+Traditionally, there was only a single source for service information,
 often in the form of a single configuration
-file (e.g. \fI/etc/passwd\fP).
-However, as other nameservices, like the Network Information
+file (e.g., \fI/etc/passwd\fP).
+However, as other name services, such as the Network Information
 Service (NIS) and the Domain Name Service (DNS), became popular,
 a method was needed
 that would be more flexible than fixed search orders coded into
 the C library.
-.LP
-The Linux libc5 with NYS support and the GNU C Library 2.x (libc.so.6)
-introduced a cleaner solution to the problem, based on the
-.B "Name Service Switch"
-mechanism used by Sun Microsystems in the Solaris 2 C library.
+The Names Server Switch mechanism
+(based on the mechanism used by Sun Microsystems in the Solaris 2 C li=
brary)
+introduced a cleaner solution to the problem.
+.SH SEE ALSO
+.BR getent (1),
+.BR nss (5)


> -------- Original Message --------
> From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Sent: Fri Mar 30 00:22:24 GMT+01:00 2012
> To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [patch] nsswitch.conf.5: update for readability and late=
st glibc
>
> On Fri, Mar 30, 2012 at 10:10 AM, Mark R Bannister
> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
>> On 29/03/2012 19:33, Michael Kerrisk (man-pages) wrote:
>>>
>>> On Fri, Oct 14, 2011 at 9:26 AM, Mark R Bannister
>>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> =A0wrote:
>>>>
>>>> Hi,
>>>>
>>>> This patch applies to nsswitch.conf.5 in man-pages-3.36.
>>>>
>>>> My changes almost completely rewrite large sections of the man pag=
e.
>>>> =A0They are needed to add clarity, correct grammar, reduce confusi=
on, and
>>>> bring up-to-date with the latest glibc. =A0I have checked the man =
page against
>>>> the nss source code in glibc 2.14.90.
>>>>
>>>> Historical notes are demoted to the footer.
>>>>
>>>> I believe the rewrite makes the man page much clearer to understan=
d, more
>>>> authoratitive and easier to read.
>>>>
>>>> A web version of the man page is available here for proof reading:
>>>> http://prose.sourceforge.net/man/linux/nsswitch.conf.5.html
>>>>
>>>> A patch is copied below, and also attached to this message.
>>>>
>>>> I am happy for my work to be released under the terms of the GNU G=
eneral
>>>> Public License.
>>>
>>> Thanks Mark. This looks good. I've done some light edits. Could you
>>> please review the below (also attached).
>>>
>>
>> Hi Michael,
>>
>> I've reviewed your edits. =A0They're almost all good, but I've had t=
o counter
>> some of your light edits. =A0Latest version below and attached.
>
> Hi Mark,
>
> Can you explain your changes? It looks like they mostly revert my
> additions of commas and formatting consistency with other pages. Why?
>
> Thanks,
>
> Michael
>
> --
> Sent from my HTC



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
