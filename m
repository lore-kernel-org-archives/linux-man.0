Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9A3793CA
	for <linux-man@vger.kernel.org>; Fri, 10 Jul 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783707138; cv=none; b=gGcoD1HuGbUzGl8Rk/P7MrUlLdGMPUFbimdTzOIztVCpMks65uQbOnXOccF8HlfxIszDcjLBK4FPHxubvGeFDJlAPjiZjEu6elZWmj/zw00jhPXL3fmte8eohwtSX+mz+Bz2QZbucWY/4yyY19HWTaolveb99emmwhYRBdF08zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783707138; c=relaxed/simple;
	bh=BKL6Rk2KLRqhhfEKLA52CqShWwmoo8HPoXEPDsfMXnA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=qAfRXUNweg1UATWSo+p3Gy2k+QLvmv9E3PqREIig5addeR8YfKT96JUTk5F3p2uCc/Uwszzjs27TL/i6+VN9PiImPDPcfDgP/ubYs0uPci4HY4ynXp+cbvHYb/idm/IctYnjkWkzkcJSfgNEBG9T8p6/wqh8X11U1BhvkUHCN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEA77Vsn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEA77Vsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783707136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=1JDiQFjqXL3cUBFhV0EcF2HIut9LhbtaAo+gzV0P68U=;
	b=KEA77Vsn3cHcvZiFr7eMCokhHf1RtHW8anVKFNk8Vp4jtG05boMRQYVZd+6Q+NWJRe3PgD
	cunIquaTO9igQjl9dS8iPjXMOy8JqB5LrkjnT3/9UbUGRzyjljdJ5Q8D6xCp24G/n40Ps2
	0VTfCUsmKowjNoyvczXPUJIbBXzJkRQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-75-nOUyW220ONCc7SFclxLdWA-1; Fri,
 10 Jul 2026 14:12:13 -0400
X-MC-Unique: nOUyW220ONCc7SFclxLdWA-1
X-Mimecast-MFC-AGG-ID: nOUyW220ONCc7SFclxLdWA_1783707132
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29F5C180266F;
	Fri, 10 Jul 2026 18:12:12 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D65273692C;
	Fri, 10 Jul 2026 18:12:11 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66AICAa2771738;
	Fri, 10 Jul 2026 14:12:10 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <alEAgbFxQi9oHME3@devuan> (message from Alejandro Colomar on
 Fri, 10 Jul 2026 16:31:18 +0200)
Date: Fri, 10 Jul 2026 14:12:10 -0400
Message-ID: <xnse5q90jp.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Alejandro Colomar <alx@kernel.org> writes:
> 	mandoc: .tmp/man/man8/ldconfig.8:212:85: STYLE: input text line longer than 80 bytes: Allow the tunable to...

Fixed.

> 	mandoc: .tmp/man/man8/ldconfig.8:250:2: WARNING: skipping paragraph macro: PP empty
> 	mandoc: .tmp/man/man8/ldconfig.8:270:2: WARNING: skipping paragraph macro: PP empty

Fixed.  I think.  We need a better language for this ;-)

> 	lint-man-poems: .tmp/man/man8/ldconfig.8: Use semantic newlines (see man-pages(7)):
> 	    222:	The tunable only applies to AT_SECURE (i.e. setuid, or elevated

Maybe fixed?  Better at least.  The linter still complains despite me
splitting it up:

.B @
The tunable only applies to AT_SECURE
(i.e. setuid, or elevated capabilities)
processes.

> 	an.tmac:.tmp/man/man8/ldconfig.8:92: style: .IR expects at least 2 arguments, got 1
> 	an.tmac:.tmp/man/man8/ldconfig.8:195: style: .IR expects at least 2 arguments, got 1
> 	an.tmac:.tmp/man/man8/ldconfig.8:197: style: .IR expects at least 2 arguments, got 1

Fixed.

>> +.SH INCLUDES
>
> I think this section belongs in new manual pages, ld.so.conf(5) and
> tuinables.conf(5), which would describe the formats of those files.
>> +.SH TUNABLES
>
> Same here; I think this belongs in tunables.conf(5).

I looked for ld.so.conf.5 but didn't see one (which kinda surprised me,
but a lot of ldconfig isn't documented either in the man pages or in the
glibc manual) so went with "what was there".  I have a slight preference
for "get this change in quickly" as glibc is releasing with the new
funcionality soon(ish) but if you want me to split these two out, I can
do that too.  Or do it later.

>> +The files
>> +.IR /etc/ld.so.conf
>
> 	s/IR/I/

Really, really, want a better language for this... ;-)

diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
index ee024b8f6..19f1ddf43 100644
--- a/man/man8/ldconfig.8
+++ b/man/man8/ldconfig.8
@@ -17,6 +17,8 @@ .SH SYNOPSIS
 .IR conf ]
 .RB [ \-r\~\c
 .IR root ]
+.RB [ \-t\~\c
+.IR tunconf ]
 .IR directory \~.\|.\|.
 .YS
 .SY /sbin/ldconfig
@@ -85,6 +87,11 @@ .SH DESCRIPTION
 .P
 Failure to follow this pattern may result in compatibility issues
 after an upgrade.
+.P
+If the file
+.I /etc/tunables.conf
+exists, it contains one tunable per line.  These tunables are stored
+in the cache and applied to every process at its startup.
 .SH OPTIONS
 .TP
 .BI \-\-format= fmt
@@ -157,6 +164,12 @@ .SH OPTIONS
 .I root
 as the root directory.
 .TP
+.BI \-t\~ tunconf
+Use
+.I tunconf
+instead of
+.IR /etc/tunables.conf .
+.TP
 .B \-\-verbose
 .TQ
 .B \-v
@@ -177,9 +190,85 @@ .SH OPTIONS
 .B \-N
 is also specified,
 the cache is still rebuilt.
+.SH INCLUDES
+The files
+.I /etc/ld.so.conf
+and
+.I /etc/tunables.conf
+allow lines to start with the word
+.I include
+followed by a path wildcard,
+and will include any files matching that wildcard.
+.SH TUNABLES
+Each line in the file
+.I /etc/tunables.conf
+specifies a tunable,
+which is a name and value separated by an equals sign.
+Each line may include zero or more words or symbols at the beginning:
+.TP
+.B overridable
+.TQ
+.B +
+Allow the tunable to be overridden by the environment variable
+(this is the default).
+.TP
+.B nonoverridable
+.TQ
+.B \-
+Do not allow the tunable to be overridden by the environment variable.
+.TP
+.B onlysecure
+.TQ
+.B @
+The tunable only applies to AT_SECURE
+(i.e. setuid, or elevated capabilities)
+processes.
+.TP
+.B nonsecure
+.TQ
+.B $
+The tunable only applies to non-AT_SECURE processes (this is the default).
+.TP
+.B anysecure
+.TQ
+.B *
+The tunable only applies to both AT_SECURE and non-AT_SECURE processes.
+.P
+The file may also contain
+.I filters ,
+which limit the tunables following it, up to the end of the file
+(or end of the included file, or start of a new included file)
+or a line with only
+.B []
+on it.  The syntax is:
+.RS
+.P
+[
+.I filter
+:
+.I pattern
+]
+.RE
+.TP
+.B proc
+The
+.I proc
+filter limits the following tunables to processes starting from the
+file matching the pattern.
+The file may be fully qualified or just the basename.
+.P
+Example config file:
+.P
+.RS
+.nf
+glibc.malloc.arenas_max=5
+onlysecure glibc.malloc.arenas_max=1
+-glibc.pthread.rseq=1
+[proc:/bin/bad.program]
+-glibc.pthread.rseq=0
+.fi
+.RE
 .SH FILES
-.\" FIXME Since glibc-2.3.4, "include" directives are supported in ld.so.conf
-.\"
 .\" FIXME Since glibc-2.4, "hwcap" directives are supported in ld.so.conf
 .PD 0
 .TP
@@ -191,6 +280,11 @@ .SH FILES
 one per line,
 in which to search for libraries.
 .TP
+.I /etc/tunables.conf
+contains a list of tunables,
+one per line,
+to apply to all newly created processes.
+.TP
 .I /etc/ld.so.cache
 contains an ordered list of libraries found in the directories
 specified in

