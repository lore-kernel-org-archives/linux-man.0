Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0838E2C1595
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784908; cv=none; b=Yx2MNcA41yQmx+dEBkQ1/ez8lHlhQ/w/UZRG4grDFxvt+IpRIP81VhESmOZ2qg7aX3wO3adNxfpbfoWGBsUjnWD79Z4dka/YVbiVA023GQUKXwp1CpQhF0bfvzxh4oQOu3mCOdjRd1HwHLuCa3sSFDtYrUHOjaYzgqOFFjxHdDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784908; c=relaxed/simple;
	bh=J33VH5wLU8Ovl8DX1lZ44E5ILbhh3gPxgPu7C3tbL9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E0sF6I7zvhJL73h2ZDi0olvkHqHdErPfqYbh4GC1fQP0tEIKxEvyeO8Lq0IVS2dcWD3RyhNU/jA2d4eu12GIMvxx4YjYxuWBRBtyI2fzqRWCOp3mfZ8+u1dQnxuD5liPattGwYCBQXlpO/Mp1GdPvfPL+HdG+CMnDIgOlW19u3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dPQ2kBT7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPQ2kBT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785784905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=+OYtF8XTnrRgF7I2K2LI5RxHcL9zWw4LpadNKVXD/0o=;
	b=dPQ2kBT7oszOkyN9rrCvhU8DHx9Pb+6w+LRCPltnm4MKnaoE9Y4GsoqfHNlauMj6eVMJud
	0mnbH4Khc6iWNYcQcpWFzltDn1rEcNNEWqagyMWYJuqZX6zYZlrCyQ8lLFNeZskEnZRbSs
	jbXN6niTmCwt3lmqnDhzTLPmXY8JYEg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-35LocJMcNpawct38xVFmVQ-1; Mon,
 03 Aug 2026 15:21:39 -0400
X-MC-Unique: 35LocJMcNpawct38xVFmVQ-1
X-Mimecast-MFC-AGG-ID: 35LocJMcNpawct38xVFmVQ_1785784898
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53E9B180034A;
	Mon,  3 Aug 2026 19:21:38 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.221])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 08EC7195608E;
	Mon,  3 Aug 2026 19:21:37 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 673JLV2p3318293;
	Mon, 3 Aug 2026 15:21:31 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Date: Mon, 03 Aug 2026 15:21:31 -0400
Message-ID: <xn5x1r57t0.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


Signed-off-by: DJ Delorie <dj@redhat.com>

---
 man/man5/tunables.conf.5 | 132 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 man/man5/tunables.conf.5

diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
new file mode 100644
index 000000000..44b32d40c
--- /dev/null
+++ b/man/man5/tunables.conf.5
@@ -0,0 +1,132 @@
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

