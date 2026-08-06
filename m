Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A5647F785
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 20:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786049091; cv=none; b=IczXwm1f9ZPFFs0KQNZ6e9byRiRSIPLEfT5gLaSm+QHSDw/zyjcBqIM09RorJShcx9q/+KttEsSiqgR1r5gAqWb0Cbb7r0bMSCmM32XoCLdgKzIuY1N5ZAb4h7rVYKUDgMX97FZFvorSMpNkVhF5UoX89ZC5x+qMK0KLjksek+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786049091; c=relaxed/simple;
	bh=nLuuWYyXzCim4DYSj22lruT/hCOOKSk7Sxes+uCwW4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gaAiWVOw+pXIlbZr2oklijEpiKrIp3DyrvABCDpLQTNuX1WAFc1E5poY4dkhzWR4wtvUc8IkQR3pJBn/qXIqotrJeLh2p3xukH/gx1mNRAWqw7X58wGei+UhupkGdHkzD3Uhym/MrJgtKmIuCweq8jDULZ8BuhK2dZmoSv78H34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JGPQm7fv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JGPQm7fv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786049089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=aj1UFaWDLB8RPdEn2Fw3IbKJX0HgvqMV9TiXBHnUiV4=;
	b=JGPQm7fvnz73yYR9dyWhtwLgoGiMgTZCgpYcqtFe5Xxgv/m+eMYVEOz2HfL7ha7xOGdBf6
	CVeUzgy0Zv8YTDzLsn2jYMJRyvhH//uH8lE6POYmnu4bOndc0Uk2wqvMrhItnXg2t2IQ9M
	UHmMN6uL/hpPvKW/wkl6qQCxyD/ddG8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-148-SA4g0QV4NZeUz350Zs0pXg-1; Thu,
 06 Aug 2026 16:44:32 -0400
X-MC-Unique: SA4g0QV4NZeUz350Zs0pXg-1
X-Mimecast-MFC-AGG-ID: SA4g0QV4NZeUz350Zs0pXg_1786049072
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 031441955DAF;
	Thu,  6 Aug 2026 20:44:32 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B72B81800346;
	Thu,  6 Aug 2026 20:44:31 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 676KiUsv3374915;
	Thu, 6 Aug 2026 16:44:30 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Date: Thu, 06 Aug 2026 16:44:30 -0400
Message-ID: <xnzeyz2d3l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111


---
 man/man5/tunables.conf.5 | 145 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 man/man5/tunables.conf.5

diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
new file mode 100644
index 000000000..29beeb8f8
--- /dev/null
+++ b/man/man5/tunables.conf.5
@@ -0,0 +1,145 @@
+.TH tunables.conf 5 (date) "Linux man-pages (unreleased)"
+.SH NAME
+tunables.conf \- tunables configuration file
+.SH SYNOPSIS
+.nf
+.B /etc/tunables.conf
+.fi
+.SH DESCRIPTION
+Tunables are a feature in the GNU C Library
+that allows application authors and distribution maintainers
+to alter the runtime library behavior to match their workload.
+For a list of supported tunables,
+please consult the glibc manual
+that corresponds to your installed version of glibc,
+or run the following command:
+.P
+.in +4n
+.EX
+ld.so \-\-list\-tunables
+.EE
+.P
+The file is parsed by
+.BR \%ldconfig (8)
+and the results stored in
+.IR /etc/ld.so.cache .
+The resulting data is read when a new process is created by
+.IR ld.so .
+.P
+Each line in the file
+.I /etc/tunables.conf
+specifies a tunable,
+which is specified with a string of the form
+.IB name = value \f[R].\f[]
+.P
+The syntax allows lines to start with the keyword
+.I include
+followed by a
+.BR \%glob (7)
+pattern.
+Files matching that pattern will be processed
+as if their contents were included at that point.
+.P
+Each line may include zero or more keywords or symbols at the beginning,
+which affect how each tunable affects each processes.
+The keywords must be separated by whitespace,
+but the symbols need not be.
+.TP
+.B overridable
+.TQ
+.B +
+Allow the tunable to be overridden by the
+.B GLIBC_TUNABLES
+environment variable when the process runs
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
+The tunable applies only to
+.B AT_SECURE
+processes,
+such as one started from a set-user-ID program,
+or one with elevated capabilities.
+.TP
+.B nonsecure
+.TQ
+.B $
+The tunable applies only to
+.RB non- AT_SECURE
+processes (this is the default).
+.TP
+.B anysecure
+.TQ
+.B *
+The tunable applies to both
+.B AT_SECURE
+and
+.RB non- AT_SECURE
+processes.
+.P
+The file may also contain
+.IR filters ,
+which limit the tunables following it.
+The effects of a filter are terminated by
+any of the following:
+.IP \[bu] 3
+The end of the file.
+.PD 0
+.IP \[bu]
+The end of an included file.
+.IP \[bu]
+An
+.B include
+directive.
+.IP \[bu]
+A new (possibly empty) filter.
+.PD
+.P
+The syntax is:
+.P
+.in +4n
+.EX
+.BI [ filter : pattern ]
+.EE
+.in
+.TP
+.B proc
+The
+.B proc
+filter limits the following tunables to processes
+whose name matches the pattern.
+The pattern may be an absolute path
+or just the base name.
+.P
+A filter can also be empty:
+.BR [] .
+Such a filter has no effects.
+.SH FILES
+.TP
+.I /etc/tunables.conf
+.TP
+.I /etc/ld.so.cache
+cached copy of tunables
+.SH EXAMPLES
+Example configuration file:
+.P
+.in +4n
+.EX
+glibc.malloc.arenas_max=5
+onlysecure glibc.malloc.arenas_max=1
+\-glibc.pthread.rseq=1
+[proc:/bin/bad.program]
+\-glibc.pthread.rseq=0
+[proc:some.program]
+\-glibc.malloc.mmap_threshold=65536
+.EE
+.in
+.SH SEE ALSO
+.BR ld.so (8),
+.BR ldconfig (8)
-- 
2.47.3

