Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.104.147.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793061497;
	b=bAYJ1wHob+chmvZCZF6X6uRY9Uw0kJh+3sdGGXDzrPb83TtAB8na7wwSY85+sABhHzHz
	 +NyCY5R+HrkwaUbfmcgo/gGw37vWCZBQuO2dPNuAJbJYx7bL1sxy2PVcY+qtWx2K4mjgP
	 gI149CSb7l7uLyiZ0sMwxRMvcTmSpdLOgTtxKfqOzHxjgVk+PKsdEqku9kF7nRCgxS/GU
	 NfRW9O6x0TCsLXsym7k1AIj5hXJroZeOL/F71aiVPw1ZvJi3i1Uj3FSprmQ2Sa7k9PfbR
	 RZbSDRSQINZhtp6kvxEjcVld9zYKQL9pDmp+l2VivzakkQ31VUmQLYVW7n/m+6jFqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793061497;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BMXJ8LFa3vnujh6Wvpp1EbYtwrWMURzu3+dPtAjZel8=;
	b=O/o4G6/hlZLMcUnepDryasrEOSjwwqiwKaGcIzXUDe0iK5qsjwyNI5BhF3+5SBqTl/DW
	 asxogbFmW1CCsJHCh5zR3tuMSdkDJckMGcRLXbE6FJq+NZO1BH8wEnNEoAFiRlfFl4KuZ
	 un1jkGtix57yl0MHF93kSeOfbXu0Nk7Z173l17uYX3v9ZgFzp+0hR6Gb7NoTlTd/ZIvoh
	 atcgb0PDIf+4+7MsLdO49qcTEwj8H9Zi5qp/DMNYEjqx2vNzvH178h173OXAv2g7fMJ+s
	 B88+cL+L78erHGBTtC9UrROF/F3NJ0mLJGFhpMoeTA70VMkY8UL0bWgqXQiSYWI4WGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gms.tf;
	spf=pass smtp.mailfrom=gms.tf;
	dkim=pass header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b="0IAv8+/n";
	arc=none smtp.remote-ip=172.104.147.125
Received: from goedel.lru.li (goedel.lru.li [172.104.147.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF27606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 00:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tf
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=0IAv8+/n
Received: from framework.lru.li (unknown [IPv6:2001:1a80:303a:0:d79e:ed35:3024:7b6b])
	(Authenticated sender: georg)
	by goedel.lru.li (Postfix) with ESMTPSA id 8E75F634C2EE;
	Tue, 27 Oct 2026 00:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 goedel.lru.li 8E75F634C2EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gms.tf;
	s=2023100216; t=1793061488;
	bh=BMXJ8LFa3vnujh6Wvpp1EbYtwrWMURzu3+dPtAjZel8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0IAv8+/nKf/6kwjjd9XvURGZW/UHk1BkXcp5ytI6WKbu1WXN0SnBbfQUeOYJfx2Rg
	 Lz2/+net6547gNw/HEJRf5MPQQhFfu+s5++CJTOKnL1pQD1A2C4dZcKj3qbLl6FY/X
	 LNQdtaEaurW4AuoG/x+T/4HShxvSYjjY2Nbw049k=
Received: by framework.lru.li (Postfix, from userid 1000)
	id C533DBABFF6; Tue, 27 Oct 2026 01:38:07 +0100 (CET)
From: Georg Sauthoff <mail@gms.tf>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Georg Sauthoff <mail@gms.tf>
Subject: [PATCH v2 0/2] man/man2/adjtimex.2: Fix include+add error
Date: Tue, 27 Oct 2026 01:37:10 +0100
Message-ID: <20261027003712.905789-1-mail@gms.tf>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025125656.877530-1-mail@gms.tf>
References: <20261025125656.877530-1-mail@gms.tf>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

this series fixes the include instructions for clock_adjtime() 
and documents another error its invocation may yield.

Changes v1 -> v2:
- split patch into series
- use define-style feature macro instead of extra section
- fix font style macro usage

Best regards,
Georg

Georg Sauthoff (2):
  man/man2/adjtimex.2: Add include and macro for clock_adjtime
  man/man2/adjtimex.2: Add error for clock_adjtime

 man/man2/adjtimex.2 | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

Range-diff against v1:
1:  ddd4886f0 ! 1:  1f6278005 man/man2/adjtimex.2: Add include, macro and error for clock_adjtime
    @@ Metadata
     Author: Georg Sauthoff <mail@gms.tf>
     
      ## Commit message ##
    -    man/man2/adjtimex.2: Add include, macro and error for clock_adjtime
    +    man/man2/adjtimex.2: Add include and macro for clock_adjtime
     
         GNU libc declares clock_adjtime() when including time.h, and not when
         just sys/timex.h is included, iff support for GNU features is requested.
    @@ Commit message
     
         (Test output is from a Fedora 43 system)
     
    -    The ERANGE error can be verified either via trying to adjust the
    -    frequency of a PHC by a value that is outside of [-X,X],
    -    where X=`cat /sys/class/ptp/ptpX/max_adjustment`,
    -    or via checking the kernel source code:
    -
    -    <https://elixir.bootlin.com/linux/v7.2.2/source/drivers/ptp/ptp_clock.c#L164>
    -
      ## man/man2/adjtimex.2 ##
     @@ man/man2/adjtimex.2: .SH SYNOPSIS
      .P
    @@ man/man2/adjtimex.2: .SH SYNOPSIS
     -.P
      .BI "int ntp_adjtime(struct timex *" buf );
     +.P
    -+.BR #include <time.h>
    ++.BR #define\~_GNU_SOURCE "  // See feature_test_macros(7)"
    ++.B #include <time.h>
     +.P
     +.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
    -+.fi
    -+.P
    -+.RS -4
    -+Feature Test Macro Requirements for glibc (see
    -+.BR feature_test_macros (7)):
    -+.RE
    -+.P
    -+.BR clock_adjtime ():
    -+.nf
    -+    _GNU_SOURCE
      .fi
      .SH DESCRIPTION
      Linux uses David L.\& Mills' clock adjustment algorithm (see RFC\ 5905).
    -@@ man/man2/adjtimex.2: .SH ERRORS
    - Under Linux, the
    - .B CAP_SYS_TIME
    - capability is required.
    -+.TP
    -+.B ERANGE
    -+The frequency offset supplied with
    -+.BR clock_adjtime ()
    -+is outside of the range clock clk_id supports.
    -+See also /sys/class/ptp/ptpX/max_adjustment when adjusting a PTP hardware clock.
    - .SH ATTRIBUTES
    - For an explanation of the terms used in this section, see
    - .BR attributes (7).
-:  --------- > 2:  578a02146 man/man2/adjtimex.2: Add error for clock_adjtime
-- 
2.55.0

