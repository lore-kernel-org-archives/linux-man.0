Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8951F5821
	for <linux-man@vger.kernel.org>; Sat, 21 Feb 2026 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707235; cv=none; b=eslmGgUE+/jK5SQnW/whjaGc7Qf3oGXxx/HWPLjUMwSt0TjChYA450FcrJrsyuukZpWFwSPB6ysm0nypKIpMJXPiUzUDHuJY/v87iavKKC9IsqZBP5n9bASNKSm2pG40gzFvr3mQMlN7Rfugvu9M91cKMcma7lK16fCKnZlGfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707235; c=relaxed/simple;
	bh=zLfrWaFcYl3lS2V3IiYCxTXFb2Sgn4hKDKJ4eghkLgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDwgrf5MGazM6YxgPx7/y5TYaJXyyT9m3wo6WTbdS4SLCjg3bhtbBl7aXcS0RHXr5NCCD5WrqpIf3ZfWk/AQqWqFeO222CUlL8I/wciU0BE/s9rhGbj7ES9JqK4GOksG0q7HLzC56dq+SZcl4x6oHx+9qEvvxnraRYTivBZu1yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEsqtH/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEsqtH/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DBDC4CEF7;
	Sat, 21 Feb 2026 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771707234;
	bh=zLfrWaFcYl3lS2V3IiYCxTXFb2Sgn4hKDKJ4eghkLgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEsqtH/47pnbnL0Y+u/MN2vgrR0AoZ9CdObY+DiwpI/hHkTA3n0SXl0KjLNAOZIkG
	 HzrSuZyUHU39occOsaaa9ih0IuX/7ZrWd0decQW5A+m31rocMsIh/c85UqbRdZunoQ
	 xoy29pssu8m5nWOlJATwFI0bTOqc3+Z1PCSdGXjlZDEY08Zf/rM2VJR7kNDw7h7LSC
	 YPxY/kF0XR19eIxETpbf6mNUIiw8iH2IErlA3/36GYM64fDCZ1m8f1feChPlLseFsO
	 8Juymgas9wFkWCwIdC9wHTFkKDvw9BzI/zfTK5PMWhk49Bda0pMo0EHI6DMHSiTBUl
	 EYK3rYP+Ytb7g==
Date: Sat, 21 Feb 2026 21:53:51 +0100
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, bug-gnulib@gnu.org, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Simon Josefsson <simon@josefsson.org>, 
	Joseph Myers <josmyers@redhat.com>
Subject: [PATCH v2 0/1] Document strnul(3)
Message-ID: <cover.1771707141.git.alx@kernel.org>
X-Mailer: git-send-email 2.51.0
References: <cover.1771686088.git.alx@kernel.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1771686088.git.alx@kernel.org>

Hi,

gnulib has added strnul(3).  I hope libc implementations eventually pick
up this API.  Let's document it in a manual page.

This v2 changes a typo, and the wording of DESCRIPTION and RETURN VALUE.


Have a lovely night!
Alex

Alejandro Colomar (1):
  man/man3/strnul.3: New page

 man/man3/strnul.3 | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 man/man3/strnul.3

Range-diff against v1:
1:  7b2c4b363f65 ! 1:  2b86d10abfc3 man/man3/strnul.3: New page
    @@ man/man3/strnul.3 (new)
     +.nf
     +.B #include <string.h>
     +.P
    -+.BI char\~*streq(const\~char\~* s );
    ++.BI char\~*strnul(const\~char\~* s );
     +.fi
     +.SH DESCRIPTION
     +.BR strnul ()
    -+returns a pointer to the terminating null byte in the string
    ++calculates the position of the terminating null byte (\[aq]\[rs]0\[aq])
    ++in the string pointed to by
     +.IR s .
     +.SH RETURN VALUE
    -+.IR s+strlen(s) .
    ++.BR strnul ()
    ++returns a pointer to the terminating null byte
    ++in the string pointed to by
    ++.IR s .
     +.SH ATTRIBUTES
     +For an explanation of the terms used in this section, see
     +.BR attributes (7).
-- 
2.51.0

