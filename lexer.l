%{

%}

%s consume_one
%%

"https://api.github.com/"	;
,?\"(avatar_url|blobs_url|gists_url|mirror_url|organizations_url|repos_url|starred_url|subscriptions_url|archive_url|assets_url|assignees_url|branches_url|clone_url|collaborators_url|commits_url|compare_url|contents_url|contributors_url|deployments_url|diff_url|downloads_url|events_url|followers_url|following_url|forks_url|git_commits_url|git_refs_url|git_tags_url|git_url|hooks_url|html_url|issue_comment_url|issue_events_url|issues_url|issue_url|keys_url|labels_url|languages_url|merges_url|milestones_url|mirror_url|notifications_url|patch_url|pull_request_url|pulls_url|received_events_url|releases_url|repository_url|review_comments_url|review_comment_url|ssh_url|stargazers_url|statuses_url|subscribers_url|subscription_url|svn_url|tags_url|tarball_url|teams_url|trees_url|upload_url|zipball_url)\":\"[^"]+ { BEGIN(consume_one); }
<consume_one>\" { BEGIN(0); }
.	ECHO;


%%


int main(int argc, char* argv[]){

	yyin=fopen(argv[1],"r");
	yylex();
	return 0;
}
