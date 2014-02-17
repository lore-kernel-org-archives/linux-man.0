From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Changes.old: fix encoding issues
Date: Mon, 17 Feb 2014 14:15:51 +0100
Message-ID: <53020B87.5050408@gmail.com>
References: <1392558491-19116-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392558491-19116-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simon,

On 02/16/2014 02:48 PM, Simon Paillard wrote:
> Introduced in 33972b0b231b9b0ee708f27fe42461dbca6e2968

Bother! I still didn't get it right.

Thanks for the patch! Applied.

Cheers,

Michael



> ---
>  Changes.old | 130 ++++++++++++++++++++++++++++++--------------------=
----------
>  1 file changed, 65 insertions(+), 65 deletions(-)
>=20
> diff --git a/Changes.old b/Changes.old
> index 6c952c5..cc2b3f3 100644
> --- a/Changes.old
> +++ b/Changes.old
> @@ -24,7 +24,7 @@ Joey (Martin) Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
>  Johannes Berg <johannes-cdvu00un1VhqZL4Zj8yd/A@public.gmane.org>
>  John V. Belmonte <jbelmonte-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Karel Kulhavy <clock-SeTKcWIBTMXby3iVrkZq2A@public.gmane.org>
> -Luis Javier Merino Mor=C3=83=C2=A1n <ljmerino-9iSeNF9qq7dxlrVtA+zy5w@public.gmane.org>
> +Luis Javier Merino Mor=C3=A1n <ljmerino-9iSeNF9qq7dxlrVtA+zy5w@public.gmane.org>
>  Martin Pool <mbp-Jg0lavp/WtvvrtOZD8d4IQ@public.gmane.org>
>  Richard Kreckel <Richard.Kreckel-HEL5OUoDxoc@public.gmane.org>
>  Vasya Pupkin <ptushnik-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -262,7 +262,7 @@ wait4.2
>      mtk
>          Rewrote this page, removing much duplicated information,
>          and replacing with pointers to wait.2.
> -    Luis Javier Merino Mor=C3=83=C2=A1n / mtk
> +    Luis Javier Merino Mor=C3=A1n / mtk
>          CONFORMING TO said "SVr4, POSIX".  Changed to "4.3BSD"
> =20
>  waitid.2
> @@ -512,7 +512,7 @@ Martin Pool <mbp-Jg0lavp/WtvvrtOZD8d4IQ@public.gmane.org>
>  Martin (Joey) Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
>  Matthias Lang <matthias-1GrQudf0pfdn57vcNwVNVA@public.gmane.org>
>  Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
> -Michael M=C3=83=C2=BChlebach <michael-Q2x2zvaZa9DtRgLqZ5aouw@public.gmane.org>
> +Michael M=C3=BChlebach <michael-Q2x2zvaZa9DtRgLqZ5aouw@public.gmane.org>
>  Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>  Sasa Stevanovic <mg94c18-WzBWcGyt27lTJgZxvjEIDAR5CAWh3ED8@public.gmane.org>
>  Serguei Leontiev <leo-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
> @@ -2070,7 +2070,7 @@ Angelo <ang3l0-WmCXPOaMvLBWk0Htik3J/w@public.gmane.org>
>  Avery Pennarun <apenwarr-S4/1YZf17xY@public.gmane.org>
>  Justin Pryzby <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
>  Martin (Joey) Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
> -Stefan Br=C3=83=C2=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> +Stefan Br=C3=BCns <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
>  Volker Reichelt <reichelt-BHES1CdJD8C662+jY7v6MhvVK+yQ3ZXh@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> @@ -2112,7 +2112,7 @@ fcntl.2
>          http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D339037
> =20
>  stat.2
> -    mtk / Stefan Br=C3=83=C2=BCns
> +    mtk / Stefan Br=C3=BCns
>          Added LINUX NOTES describing nanosecond timestamps.
> =20
>  frexp.3
> @@ -21052,7 +21052,7 @@ Jan Engelhardt <jengelh-nopoi9nDyk+ELgA04lAiVw@public.gmane.org>
>  Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
> -P=C3=83=C2=A1draig Brady <P@draigbrady.com>
> +P=C3=A1draig Brady <P@draigbrady.com>
>  Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
>  scarlettsp <scarlettsp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
> @@ -21368,7 +21368,7 @@ been incorporated in changes in this release:
>  Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
>  David Prevot <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
>  Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> -Krzysztof =C3=85=C2=BBelechowski <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
> +Krzysztof =C5=BBelechowski <giecrilj-n4IAqcmFnHAX1+iMCFCb4w@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
> =20
> @@ -22071,7 +22071,7 @@ Alan Curry <pacman-ptgZXYu0fikgsBAKwltoeQ@public.gmane.org>
>  Benjamin Poirier <benjamin.poirier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZeTW4wlIGRCZ@public.gmane.org>
>  David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
>  Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> @@ -22258,7 +22258,7 @@ in the changelog below) reports, notes and id=
eas that have been
>  incorporated in changes in this release:
> =20
>  Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Eric W. Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
>  Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
> @@ -22428,7 +22428,7 @@ Alain Benedetti <alainb06-GANU6spQydw@public.gmane.org>
>  carado <carado-kt3qwsSULN8dnm+yROfE0A@public.gmane.org>
>  Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>  Clemens Ladisch <clemens-P6GI/4k7KOmELgA04lAiVw@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
>  Jessica McKellar <jesstess-3s7WtUTddSA@public.gmane.org>
> @@ -22746,10 +22746,10 @@ incorporated in changes in this release:
> =20
>  Akihiro MOTOKI <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Artyom Pervukhin <artyom-mKnqvlXXQCMvJsYlp49lxw@public.gmane.org>
> -Be=C3=85=C2=88as Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
> +Be=C5=88as Petr <xbenas00-qjZHU19XGF/maGwbMATS8qVXKuFTiq87@public.gmane.org>
>  Ben Bacarisse <software-QW8DL1zPdzBaa/9Udqfwiw@public.gmane.org>
>  Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
> +David Pr=C3=A9vot <david-EYFo4vFR6XNAfugRpC6u6w@public.gmane.org>
>  Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>  Eric Blake <ebb9-PGZyUNKar/Q@public.gmane.org>
> @@ -22770,7 +22770,7 @@ New and rewritten pages
>  -----------------------
> =20
>  get_nprocs_conf.3
> -    Be=C3=85=C2=88as Petr
> +    Be=C5=88as Petr
>          New page documenting get_nprocs_conf(3) and get_nprocs(3)
>      Michael Kerrisk
>          Some additions and improvements
> @@ -22819,7 +22819,7 @@ aligned_alloc.3
>          New link to posix_memalign.3
> =20
>  get_nprocs.3
> -    Be=C3=85=C2=88as Petr
> +    Be=C5=88as Petr
>          Link to new get_nprocs_conf.3 page
> =20
>  malloc_set_state.3
> @@ -22985,7 +22985,7 @@ Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>  Petr Gajdos <pgajdos-AlSwsSmVLrQ@public.gmane.org>
>  Regid Ichira <regid23-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
>  Reuben Thomas <rrt-0NV8xZLkR+A@public.gmane.org>
> -Ricardo Catalinas Jim=C3=83=C2=A9nez <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +Ricardo Catalinas Jim=C3=A9nez <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
>  Tetsuo Handa <penguin-kernel-1yMVhJb1mP/7nzcFbJAaVXf5DAMn2ifp@public.gmane.org>
>  <who-t+iU6Fs6Cel2agKppZcdFSwD8/FfD2ys@public.gmane.org>
> @@ -23140,7 +23140,7 @@ rcmd.3
>          glibc eventually added a declaration of iruserok() in versio=
n 2.12
> =20
>  sysconf.3
> -    Michael Kerrisk  [Ricardo Catalinas Jim=C3=83=C2=A9nez]
> +    Michael Kerrisk  [Ricardo Catalinas Jim=C3=A9nez]
>          Add mention of _SC_SYMLOOP_MAX
> =20
>  nologin.5
> @@ -23489,7 +23489,7 @@ Angelo Borsotti <angelo.borsotti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org >
>  Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
>  Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZQivdfXVPZ6z@public.gmane.org>
>  Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> @@ -23497,7 +23497,7 @@ Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
>  Jason Baron <jbaron-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -Jean-Michel Vourg=C3=83=C2=A8re <jmv_deb-7u9evF0ihP7QT0dZR+AlfA@public.gmane.org>
> +Jean-Michel Vourg=C3=A8re <jmv_deb-7u9evF0ihP7QT0dZR+AlfA@public.gmane.org>
>  Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Josh Triplett <josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org>
>  Kasper Dupont <kasperd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -23868,7 +23868,7 @@ fopencookie.3
>              See http://sourceware.org/bugzilla/show_bug.cgi?id=3D207=
4
> =20
>  getaddrinfo.3
> -    Jean-Michel Vourg=C3=83=C2=A8re
> +    Jean-Michel Vourg=C3=A8re
>          Note that AI_ADDRCONFIG is not affected by loopback addresse=
s
>              See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D6=
60479
> =20
> @@ -24057,7 +24057,7 @@ Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
>  Christoph Lameter <cl-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
>  Colin McCabe <cmccabe-VL1tVIhH15PQjUSlxSEPGw@public.gmane.org>
>  Daniel Zingaro <daniel.zingaro-H217xnMUJC0sA/PxXw9srA@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Denys Vlasenko <vda.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Henry Hu <henry.hu.sh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>
> @@ -24075,7 +24075,7 @@ Shawn Landden <shawnlandden-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>  Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> -=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =C3=90=C2=9A=C3=90=C2=
=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=C3=90=C2=B5=C3=91=C2=
=80=C3=90=C2=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=
=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> =20
> @@ -24111,7 +24111,7 @@ clone.2
>          Rewrite discussion of sys_clone
> =20
>  futex.2
> -    =C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =C3=90=C2=9A=C3=
=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=C3=90=C2=B5=C3=
=91=C2=80=C3=90=C2=B3
> +    =D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=
=B5=D1=80=D0=B3
>          Consolidate error descriptions to ERRORS
>      Michael Kerrisk
>          Various wording fix-ups
> @@ -24168,7 +24168,7 @@ tkill.2
>  ioprio_set.2
>      Colin McCabe
>          Clarify the multithreaded behavior of ioprio_set(2)
> -    Michael Kerrisk  [=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA=
 =C3=90=C2=9A=C3=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=
=C3=90=C2=B5=C3=91=C2=80=C3=90=C2=B3, Kalle Olavi Niemitalo]
> +    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=
=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3, Kalle Olavi Niemitalo]
>          Document who=3D=3D0 for IOPRIO_WHO_PROCESS and IOPRIO_WHO_PG=
RP
>              For IOPRIO_WHO_PROCESS, who=3D=3D0 means operate on the =
caller.
>              For IOPRIO_WHO_PGRP, who=3D=3D0 means operate on the cal=
ler's
> @@ -24495,10 +24495,10 @@ Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>  Anatoli Klassen <anatoli-onJMq2Hob96sTnJN9+BGXg@public.gmane.org>
>  Andreas Schwab <schwab-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>  Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Eric Dumazet <edumazet-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>  Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -Fr=C3=83=C2=A9d=C3=83=C2=A9ric Bri=C3=83=C2=A8re <fbriere-N2t/G/wdcydNg+MwTxZMZA@public.gmane.org=
t>
> +Fr=C3=A9d=C3=A9ric Bri=C3=A8re <fbriere-N2t/G/wdcyfR7s880joybQ@public.gmane.org>
>  Fredrik Arnerup <arnerup-UNjuZkX4dYU@public.gmane.org>
>  Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
>  Jan Engelhardt <jengelh-9+2X+4sQBs8@public.gmane.org>
> @@ -24539,7 +24539,7 @@ Various pages
>          Global fix: s/-/\\-/ when real hyphen is required (e.g., in =
code)
> =20
>  Various pages
> -    David Pr=C3=83=C2=A9vot [Michael Kerrisk]
> +    David Pr=C3=A9vot [Michael Kerrisk]
>          Global fix: Various consistency fixes for SEE ALSO
> =20
>  Various pages
> @@ -24597,7 +24597,7 @@ getitimer.2
>          Fix types used to declare fields in timeval struct
> =20
>  keyctl.2
> -    David Pr=C3=83=C2=A9vot
> +    David Pr=C3=A9vot
>          Reorder SEE ALSO, without .br
> =20
>  poll.2
> @@ -24692,7 +24692,7 @@ ttyname.3
>  proc.5
>      Michael Kerrisk
>          Clarify header file related to 'flags' field of /proc/PID/st=
at
> -    Michael Kerrisk  [Fr=C3=83=C2=A9d=C3=83=C2=A9ric Bri=C3=83=C2=A8=
re]
> +    Michael Kerrisk  [Fr=C3=A9d=C3=A9ric Bri=C3=A8re]
>          Update description of 'starttime' field of /proc/PID/stat
>              The unit of measurement changed from jiffies to clock ti=
cks in
>              Linux 2.6.
> @@ -24746,7 +24746,7 @@ in the changelog below) reports, notes, and i=
deas that have been
>  incorporated in changes in this release:
> =20
>  Bert Hubert <bert.hubert-dxZxOz86jR8sYtaaK7K+xw@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  James Youngman <jay-mXXj517/zsQ@public.gmane.org>
>  Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>  Lars Wirzenius <liw-X3B1VOXEql0@public.gmane.org>
> @@ -24969,7 +24969,7 @@ incorporated in changes in this release:
> =20
>  Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
>  Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Eric Dumazet <eric.dumazet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Felipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -25203,10 +25203,10 @@ in the changelog below) reports, notes, and=
 ideas that have been
>  incorporated in changes in this release:
> =20
>  Andrew Perepechko <andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org>
> -C=C3=83=C2=A9dric Boutillier <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +C=C3=A9dric Boutillier <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
>  Daan Spitz <daan.f.spitz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Garrett Cooper <yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  James Noble <James.Noble-c3YU+qzk/GXuufBYgWm87A@public.gmane.org>
> @@ -25227,7 +25227,7 @@ Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Starlight <starlight.2013q1-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
>  Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>
>  Wolfgang Rohdewald <wolfgang-zdKOYOBJ9IsPyMaTEpOvjQ@public.gmane.org>
> -Zsb=C3=83=C2=A1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
> +Zsb=C3=A1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> =20
> @@ -25396,7 +25396,7 @@ setns.2
>          Add example program
> =20
>  sigaction.2
> -    Michael Kerrisk  [Zsb=C3=83=C2=A1n Ambrus]
> +    Michael Kerrisk  [Zsb=C3=A1n Ambrus]
>          Note feature test macro requirements for 'siginfo_t'
>              See https://bugzilla.kernel.org/show_bug.cgi?id=3D52931
> =20
> @@ -25540,7 +25540,7 @@ The following people contributed patches/fixe=
s or (noted in brackets
>  in the changelog below) reports, notes, and ideas that have been
>  incorporated in changes in this release:
> =20
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -25834,7 +25834,7 @@ Colin Walters <walters-gPq2gbYjIk8dnm+yROfE0A@public.gmane.org>
>  Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>  Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
>  Daniel P. Berrange <berrange-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>  Flavio Leitner <fbl-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> @@ -25850,7 +25850,7 @@ Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
>  Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Simon Heimberg <simohe-y/QulLNSqklyDzI6CaY1VQ@public.gmane.org>
>  Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> -T=C3=83=C2=B6r=C3=83=C2=B6k Edwin <edwintorok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +T=C3=B6r=C3=B6k Edwin <edwintorok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>
> =20
> @@ -25986,7 +25986,7 @@ mmap.2
>              stays in page cache even after the mapping is unmapped a=
nd the file
>              is closed. So if some process dirties such page, other m=
appings
>              will see the changes rather than zeroes.
> -    Michael Kerrisk  [T=C3=83=C2=B6r=C3=83=C2=B6k Edwin]
> +    Michael Kerrisk  [T=C3=B6r=C3=B6k Edwin]
>          Some 'flags' values require a feature test macro to be defin=
ed
>              Add text to NOTES noting that some MAP_* constants are
>              defined only if a suitable feature test macro is defined=
=2E
> @@ -26341,7 +26341,7 @@ Brian M. Carlson <sandals-spVehEqlxw627WubY2PhZYMZEew6lZXS@public.gmane.org=
t>
>  Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
>  Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>  Damien Grassart <damien-Uo5SsgSf8ZRWk0Htik3J/w@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Krzysztof Konopko <krzysztof.konopko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -26648,11 +26648,11 @@ ip.7
> =20
>  units.7
>      Brian M. Carlson
> -        units should use an actual =C3=82=C2=B5
> +        units should use an actual =C2=B5
>              The units(7) man page uses an ASCII u in place of the ac=
tual Greek
>              letter mu.  Since we're in the twenty-first century, wit=
h
>              UTF-8-compatible terminals and terminal emulators, we sh=
ould use
> -            the actual letter =C3=82=C2=B5 instead of an ASCII appro=
ximation.
> +            the actual letter =C2=B5 instead of an ASCII approximati=
on.
> =20
>              See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D7=
04787
> =20
> @@ -26675,14 +26675,14 @@ Anthony Foiani <anthony.foiani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>  Dan Jacobson <jidanni-8D0D3YcSAvhAfugRpC6u6w@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
>  Georg Sauthoff <mail-vzQcyvifq/Y@public.gmane.org>
>  Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -J=C3=83=C2=A9r=C3=83=C2=A9mie Galarneau <jeremie.galarneau@efficios.=
com>
> +J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau-vg+e7yoeK/dWk0Htik3J/w@public.gmane.org>
>  Jon Grant <jg-hus3n9K41k0@public.gmane.org>
>  Manuel Traut <manut-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> -=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =C3=90=C2=9A=C3=90=C2=
=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=C3=90=C2=B5=C3=91=C2=
=80=C3=90=C2=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=
=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
>  Pavel Emelyanov <xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
> @@ -26797,7 +26797,7 @@ prctl.2
>              attribute.
> =20
>  pread.2
> -    Michael Kerrisk  [=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA=
 =C3=90=C2=9A=C3=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=
=C3=90=C2=B5=C3=91=C2=80=C3=90=C2=B3]
> +    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=
=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3]
>          pread() and pwrite() are especially useful in multithreaded =
applications
> =20
>  recv.2
> @@ -27205,7 +27205,7 @@ tempnam.3
>          RETURN VALUE: mention that 'errno' is set on error
> =20
>  timegm.3
> -    J=C3=83=C2=A9r=C3=83=C2=A9mie Galarneau
> +    J=C3=A9r=C3=A9mie Galarneau
>          copy the string returned by getenv()
>              The example of a portable version of timegm() uses the s=
tring
>              returned by getenv() after calling setenv() on the same
> @@ -27313,7 +27313,7 @@ Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
>  Benjamin Poirier <bpoirier-l3A5Bk7waGM@public.gmane.org>
>  Chris Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>
>  Chuck Coffing <clc-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
>  Felix_Schulte-dDVk9ABzqyjQT0dZR+AlfA@public.gmane.org
> @@ -27533,7 +27533,7 @@ Andrew Hunter <andrewhhunter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Chen Gang <gang.chen-bOixZGp5f+dBDgjK7y7TUQ@public.gmane.org>
>  Christopher Hall <chall0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Christos Tsopokis <christos-6IeR8MbSVDhMo1R+fwTmgw@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Doug Goldstein <cardoe-VPKZcK2rSRzQT0dZR+AlfA@public.gmane.org>
>  Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -27558,7 +27558,7 @@ Stas <stas.grumbler-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
>  Will Newton <will.newton-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>  Zdenek Pavlas <zpavlas-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -Zsb=C3=83=C2=A1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
> +Zsb=C3=A1n Ambrus <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> =20
> @@ -27568,7 +27568,7 @@ Newly documented interfaces in existing pages
>  ---------------------------------------------
> =20
>  ioctl_list.2
> -    Zsb=C3=83=C2=A1n Ambrus
> +    Zsb=C3=A1n Ambrus
>          Document FAT_IOCTL_GET_ATTRIBUTES
>              The attached patch adds four ioctls from linux/msdos_fs.=
h to the
>              ioctl_list(2) manpage.
> @@ -27922,7 +27922,7 @@ Alfred Agrell <alfred-q+Fw1ITNTbbiB9QmIjCX8w@public.gmane.org>
>  Andreas Sandberg <andreas.sandberg-1zs4UD6AkMk@public.gmane.org>
>  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>  David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Fabrice Bauzac <libnoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Greg Price <price-3s7WtUTddSA@public.gmane.org>
>  Jon Grant <jg-hus3n9K41k0@public.gmane.org>
> @@ -28509,7 +28509,7 @@ Arif Zaman <arifz-fYzJem42smjeSsnKWxLhYw@public.gmane.org>
>  Bert Wesarg <bert.wesarg-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>  Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  David Malcolm <dmalcolm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Dongsheng Song <dongsheng.song-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  James Smith <james-rDlnuv1X39s@public.gmane.org>
> @@ -28522,10 +28522,10 @@ Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Matthias Klose <doko-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> -Moritz 'Morty' Str=C3=83=C2=BCbe <morty-hi6Y0CQ0nG0@public.gmane.org>
> +Moritz 'Morty' Str=C3=BCbe <morty-hi6Y0CQ0nG0@public.gmane.org>
>  Nadav Har'El <nyh-TS7m/3hpY0sOpacJJkBjfT4kX+cae0hd@public.gmane.org>
> -Ond=C3=85=C2=99ej B=C3=83=C2=ADlka <neleai-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
> -Pr=C3=83=C2=A1draig Brady <P@draigBrady.com>
> +Ond=C5=99ej B=C3=ADlka <neleai-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org>
> +Pr=C3=A1draig Brady <P@draigBrady.com>
>  Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
>  Raphael Geissert <geissert-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> @@ -28751,7 +28751,7 @@ puts.3
>          SEE ALSO: replace reference to gets(3) with fgets(3)
> =20
>  scanf.3
> -    Michael Kerrisk  [Ond=C3=85=C2=99ej B=C3=83=C2=ADlka]
> +    Michael Kerrisk  [Ond=C5=99ej B=C3=ADlka]
>          Improve discussion of obsolete 'a' dynamic allocation modifi=
er
> =20
>  setjmp.3
> @@ -28788,12 +28788,12 @@ sincos.3
>              The functions sincos(), sincosf() and sincosl() are thre=
ad safe.
> =20
>  string.3
> -    Moritz 'Morty' Str=C3=83=C2=BCbe
> +    Moritz 'Morty' Str=C3=BCbe
>          Add short description of the functions
>              It is helpful to have a short description about what the=
 different
>              functions in string.h do.
>      Michael Kerrisk
> -        Fixes and enhancements to Moritz Str=C3=83=C2=BCbe's patch
> +        Fixes and enhancements to Moritz Str=C3=BCbe's patch
> =20
>  strptime.3
>      Michael Kerrisk  [Mathieu Malaterre, Simon Paillard]
> @@ -28958,7 +28958,7 @@ Thomas Posch <man-pages-rFD0ZvQNamoRTZDQkHJ3v7NAH6kLmebB@public.gmane.org>
>  Tilman Schmidt <tilman-ZTO5kqT2PaM@public.gmane.org>
>  Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
>  Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
> -=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =C3=90=C2=9A=C3=90=C2=
=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=C3=90=C2=B5=C3=91=C2=
=80=C3=90=C2=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=
=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> =20
> @@ -29069,7 +29069,7 @@ fcntl.2
>          POSIX.1 specifies F_SETOWN and F_GETOWN for sockets/SIGURG
> =20
>  getrlimit.2
> -    Michael Kerrisk  [=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA=
 =C3=90=C2=9A=C3=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=
=C3=90=C2=B5=C3=91=C2=80=C3=90=C2=B3]
> +    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=
=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3]
>          Note that rlim_cur can be set lower than current resource co=
nsumption
> =20
>  getsockopt.2
> @@ -29303,7 +29303,7 @@ incorporated in changes in this release:
> =20
>  Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
>  Daniel Borkmann <dborkman-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> -David Pr=C3=83=C2=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> +David Pr=C3=A9vot <taffit-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Fabrice Bauzac <libnoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>  Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> @@ -29314,8 +29314,8 @@ Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>  Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
>  Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>  Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
> -=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA =C3=90=C2=9A=C3=90=C2=
=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=C3=90=C2=B5=C3=91=C2=
=80=C3=90=C2=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> -=C3=A6=C2=9C=C2=AA=C3=A5=C2=8D=C2=B7=C3=A8=C2=B5=C2=B7=C3=A7=C2=9A=C2=
=84=C3=A6=C2=B5=C2=AA <ayjj_8109-9uewiaClKEY@public.gmane.org>
> +=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=BD=D0=B1=D0=B5=D1=
=80=D0=B3 <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +=E6=9C=AA=E5=8D=B7=E8=B5=B7=E7=9A=84=E6=B5=AA <ayjj_8109-9uewiaClKEY@public.gmane.org>
> =20
>  Apologies if I missed anyone!
> =20
> @@ -29388,7 +29388,7 @@ msgctl.2
>          Add note about ignored arg to IPC_RMID
> =20
>  prctl.2
> -    Michael Kerrisk  [=C3=90=C2=9C=C3=90=C2=B0=C3=91=C2=80=C3=90=C2=BA=
 =C3=90=C2=9A=C3=90=C2=BE=C3=91=C2=80=C3=90=C2=B5=C3=90=C2=BD=C3=90=C2=B1=
=C3=90=C2=B5=C3=91=C2=80=C3=90=C2=B3]
> +    Michael Kerrisk  [=D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=
=B5=D0=BD=D0=B1=D0=B5=D1=80=D0=B3]
>          PR_SET_PDEATHSIG value is preserved across execve(2)
> =20
>  recv.2
> @@ -29401,7 +29401,7 @@ recv.2
>          Add description of 'buf' and 'len' in recvfrom() section
>          'addrlen' should be 0 (*not* NULL) when 'src_addr' is NULL
>          Improve text describing recvfrom() call that is equivalent t=
o recv()
> -    Michael Kerrisk  [=C3=A6=C2=9C=C2=AA=C3=A5=C2=8D=C2=B7=C3=A8=C2=B5=
=C2=B7=C3=A7=C2=9A=C2=84=C3=A6=C2=B5=C2=AA]
> +    Michael Kerrisk  [=E6=9C=AA=E5=8D=B7=E8=B5=B7=E7=9A=84=E6=B5=AA]
>          Describe the various cases where the return value can be 0
> =20
>  shmctl.2
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
