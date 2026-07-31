Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CE470129
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522682; cv=none; b=BQ2Isal+ebcpo+Zw/bCTmOJHz7uOwdqghaNiUlJDaZAWz7rgetbZdRSEchtTjaKM2RxRwtm1gcHx8TIlTWIyPytZxLgRM2Pt9gG27a836U0fbSUUz1QanaMP0ib5vEgeDZ4eshglSfrmY9MOAFYc1aKyU5An667F/dQadytyCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522682; c=relaxed/simple;
	bh=AQfsOh7SsBNC+UlmPw1UBKAji7KZ9qMfyqE6nvJn33o=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To:Cc; b=oWzaRFTuBFKA5bavezPOGjF5/oAGSKr5Ue05Wti27JMl6UAUmh2/gVoBFSUHF0jiN+KLHa9nE9Ko4gK95MCZa3ZymVP2UGLLOhe9WowJdOVEX/CsY2966ATZeUIFvmMZiwdQ5sG1wsfCTOGILtHMp8j6Y7PYb3+D0bYHj7Z9o8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JeHwkRWO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JeHwkRWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785522680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=UxoDfX26tvlvKaruMty+oMd349kUCaP0xFOJTgT+mA8=;
	b=JeHwkRWO1k2ln9lRcTuzqTfUCLO8cU6NWHwgV8WssJ2CSwVNAwKsVKUSZ7AowmrvnCVe1D
	JayVfTWhutcT6ia2KmI1xkpZm3kjMPhqjmHFTiG194mVwotgpjlIhhfDW3lump3LT1opgN
	qGEWPdEcO9/diC57vx96EgGG2qxvzF8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-362-DJpHhnaUN9-8SzytgAg09A-1; Fri,
 31 Jul 2026 14:31:16 -0400
X-MC-Unique: DJpHhnaUN9-8SzytgAg09A-1
X-Mimecast-MFC-AGG-ID: DJpHhnaUN9-8SzytgAg09A_1785522675
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A81C19560A2;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.59])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5343E414;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66VIVBvn3140582
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:31:11 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66VIVBj23140581;
	Fri, 31 Jul 2026 14:31:11 -0400
Message-ID: <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
In-Reply-To: <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
References: <cover.1785522144.git.dj@redhat.com>
	<ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Fri, 31 Jul 2026 14:22:24 -0400
Subject: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide tunables
 config
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
Cc: alx@kernel.org
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man5/tunables.conf.5 | 134 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 man/man5/tunables.conf.5

diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
new file mode 100644
index 000000000..f96355bed
--- /dev/null
+++ b/man/man5/tunables.conf.5
@@ -0,0 +1,134 @@
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
+.B ld.so --list-tunables
+.EE
+.P
+Each line in the file
+.I /etc/tunables.conf
+specifies a tunable,
+which is specified with a string of the form
+.IB name = value \f[R].\f[]
+.P
+The syntax allows lines to start with the keyword
+.I include
+followed by a path wildcard.
+The wildcard is a path specification in the
+.BR \%glob (7)
+format.
+Matching files will be processed
+as if their contents were included
+at that point in the config file.
+.P
+The file is parsed by
+.BR \%ldconfig (8)
+and the results stored in
+.IR /etc/ld.so.cache .
+The resulting data is read when a new process is created by
+.IR ld.so .
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
+which limit the tunables following it,
+up to the end of the file
+(or end of the included file,
+or start of a new included file)
+or a line with only
+.B []
+on it.
+The syntax is:
+.P
+.in +4n
+.EX
+.RI [ filter : pattern ]
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

