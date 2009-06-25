namespace :mondrian do
  
  def verify_which_branch_is?
    return false if (`git branch`).include?('* working')
    true  
  end

  desc 'Go branch master to project.'
  task :branchmaster do
    Rake::Task['mondrian:branchmaster'].invoke if verify_which_branch_is?
    sh "git checkout master"
  end

  desc 'Go branch working to project.'
  task :branchworking do
    Rake::Task['mondrian:branchworking'].invoke if not verify_which_branch_is?
    sh "git checkout working"
		sh "git merge master"
  end

  desc 'Go merge master to project.'
  task :mergemaster do
    Rake::Task['mondrian:mergemaster'].invoke if not verify_which_branch_is?
    sh "git merge master"
  end

  desc 'Go merge working to project.'
  task :mergeworking do
    Rake::Task['mondrian:mergeworking'].invoke if verify_which_branch_is?
    sh "git merge working"
  end

  desc 'Go cucumber tests to project.'
  task :cucumber do
  	Rake::Task['mondrian:cucumber'].invoke
		result = `cucumber features -l pt`
    if result.include?('failed,')
  	  puts "CUCUMBER TESTS [failed]"
			puts "DEBUGAR O TESTE ANTES DO GIT PUSH"
      puts result
      exit
    end
	  puts "CUCUMBER TESTS [passed,skipped,undefined]"
    puts result
  end

end
