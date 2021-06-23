pipeline {
    
    agent any

    parameters {
        choice(
            name: 'REQUESTED_ACTION',
            choices: ['init_backend_apply', 'apply', 'apply_planned'],
            description: ''
        )
    }
    
    stages {
        stage('Example') {
            steps {
                script {
                    if (params.REQUESTED_ACTION == 'init_backend_apply'){
                        env.project_path = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'project_path')]
                        env.region_name = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'region_name')]
                        env.backend_bucket_name = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'backend_bucket_name')]
                        env.tfstate_filename = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'tfstate_filename')]
                        env.action_state = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'action_state')]
                        env.force_init = input message: 'Please enter the action state',
                            parameters: [string(defaultValue: '', description: '', name: 'force_init')]
                        env.bucket_name = input message: 'Please enter the bucket name',
                            parameters: [string(defaultValue: '', description: '', name: 'bucket_name')]

                        echo "Executing ansible role" 
                        sh 'ansible-playbook playbook.yml -e "project_path=${project_path} region_name=${region_name} backend_bucket_name=${backend_bucket_name} tfstate_filename=${tfstate_filename} action_state=${action_state} force_init=${force_init} bucket_name=${bucket_name}"'
                    }
                    else if (params.REQUESTED_ACTION == 'apply'){
                        env.project_path = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'project_path')]
                        env.action_state = input message: 'Please enter the action state',
                            parameters: [string(defaultValue: '', description: '', name: 'state')]
                        env.bucket_name = input message: 'Please enter the bucket name',
                            parameters: [string(defaultValue: '', description: '', name: 'bucket_name')]
                        
                        echo "Executing ansible role" 
                        sh 'ansible-playbook playbook.yml -e "project_path=${project_path} action_state=${action_state} bucket_name=${bucket_name}"'
                    }
                    else if (params.REQUESTED_ACTION == 'apply_planned'){
                        env.project_path = input message: 'Please enter the projet path',
                            parameters: [string(defaultValue: '', description: '', name: 'project_path')]
                        env.action_state = input message: 'Please enter the action state',
                            parameters: [string(defaultValue: '', description: '', name: 'state')]
                        env.plan_file = input message: 'Please enter the bucket name',
                            parameters: [string(defaultValue: '', description: '', name: 'plan_file')]
                        
                        echo "Executing ansible role" 
                        sh 'ansible-playbook playbook_planned.yml -e "project_path=${project_path} action_state=${action_state} plan_file=${plan_file}"'
                    }
                }
            }
        }
    }
}
